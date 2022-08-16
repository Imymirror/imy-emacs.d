;;  -*- lexical-binding: t; -*-

(defvar trans-buffer-name "*trans-mode*")
(defvar trans-popup-buffer-name "*trans-mode-popup*")

(defcustom trans-command "trans"
  "trans command name."
  :type 'string
  :group 'trans-mode)

(defcustom trans-verbose-p nil
  "Is in verbose mode. (default: nil)"
  :type 'boolean
  :group 'trans-mode)

(defcustom trans-source "auto"
  "Source language. (default: auto)"
  :type 'string
  :group 'trans-mode)

(defcustom trans-target "zh"
  "Target language. (default: en)"
  :type 'string
  :group 'trans-mode)

(defcustom trans-second-target "en"
  "Target language. (default: en)"
  :type 'string
  :group 'trans-mode)

(defun trans-region-string()
  "return mark region string"
            (buffer-substring-no-properties (region-beginning) (region-end)))

(defun trans-eval-string (string) (eval (car (read-from-string string))))

(defun trans-shell-command-to-string(text)
  (let ((text  (shell-command-to-string text)))
    (if (equal text "") ""
      (substring text  0 -1))))

(defun trans-substring(text)
  (if (equal text "") ""
    (substring text  0 -1)))

(defun trans-shell-identify(text)
  "shell-command about check Language Identification"
  (trans-shell-command-to-string  (concat trans-command " -id " "\'" text "\'" " | sed '5!d' | awk -F ' ' '{print $2}' | grep " trans-target )))

(defun trans-identify-p (text)
  "Language Identification."
  (let ((check-string (trans-shell-identify text) ))
    (if (equal check-string "") nil t)))

(defun escape-doublequotes(text)
  "Escape doublequotes for text."
  (let ((string ""))
    (with-temp-buffer
      (insert text)
      (goto-char (point-min))
      (while (search-forward "\"" nil t 1)
        (replace-match "\\\\\""))
      (setq string (buffer-substring-no-properties (point-min) (point-max))))
    string))


(defun trans-switch-to-buffer()
  "switch to translate buffer."
  (interactive)
  (switch-to-buffer trans-buffer-name))

(defun trans-save-to-buffer(text)
  "save text to trans buffer."
  (let ((buf (get-buffer-create trans-buffer-name)))
    (with-current-buffer buf
      (insert "------------------------------------------------------------------------\n")
      (insert text)
      (insert "\n"))))

(defun trans-no-check-id (verbose source target text)
  (let (
        (cmd-string   (concat trans-command
                              (if verbose "" " -b")
                              (if source (concat " -s " source) "")
                              (if target (concat " -t " target) "")
                              " " (concat "\"" text "\""))))
    (trans-shell-command-to-string cmd-string)))



(defun trans (verbose source target text)
  (let* ((target (if (trans-identify-p text) trans-second-target target))
         (cmd-string   (concat trans-command
                               (if verbose "" " -b")
                               (if source (concat " -s " source) "")
                               (if target (concat " -t " target) "")
                               " " (concat "\"" text "\""))))
    (trans-shell-command-to-string cmd-string)))



(defun trans-input (text)
  "translate input text. push translate string to kill-ring. save to trans buffer."
  (interactive "sEnter your source text: ")
  (let* ( (text (escape-doublequotes text))
          (trans-string (trans trans-verbose-p trans-source trans-target text) ))

    (kill-new trans-string)
    (trans-save-to-buffer trans-string)
    trans-string))

(defun trans-popup (text)
  "popup text."
  ;; (x-popup-menu t (list trans-buffer-name
  ;;                       (list "PANE"
  ;;                             (list text nil))))
  (with-output-to-temp-buffer trans-popup-buffer-name
    (print text)
    (pop-to-buffer trans-popup-buffer-name)))

(defun trans-input-popup(text)
  "like trans-input, but popup translate string."
  (interactive "sEnter your source text: ")
  (let ((trans-string (trans-input text) ))
    (trans-popup trans-string)))

(defun trans-toggle-verbose()
  "trun on verbose. show more infomation."
  (interactive)
  (if trans-verbose-p
      (setq trans-verbose-p nil)
    (setq trans-verbose-p t))
  (message (concat "trans-verbose-p : " (if trans-verbose-p "t" "nil"))))

(defun trans-region-or-clipboard()
  "if region-active-p true, translate mark region, otherwise translate clipboard text"
  (interactive)
  (if (region-active-p)
      (trans-input (trans-region-string))
    (trans-input (current-kill 0))
    ))

(defun trans-region-or-clipboard-popup()
  "li trans-region-or-clipboard, but popup text."
  (interactive)
  (if (region-active-p)
      (trans-input-popup (trans-region-string))
    (trans-input-popup (current-kill 0))))


(defmacro macfa/install-macfa (process-name &optional rename)
  "Give process-name regarding macos, install the interactive command to front the app"
  (let ((func-name (if rename rename process-name)))
    `(defun  ,(intern (format "macfa-%s" (downcase (replace-regexp-in-string " " "-" func-name)))) ()
       ,(format "front macs app : %s " func-name)
       (interactive)
       (macfa/switch-app-by-process-name ,process-name))))



(defmacro trans-install-target-function (target)
  "Give translate target, install the interactive command : trans-input-target"
  
  `(defun ,(intern (format "trans-input-%s" target)) (text)
     ,(format "translate input text to target %s" target)
     (interactive "sEnter your source text: ")
          (let* ( (text (escape-doublequotes text))
                  (trans-string (trans-no-check-id trans-verbose-p trans-source ,(format "%s" target ) text)))

    (kill-new trans-string)
    (trans-save-to-buffer trans-string)
    trans-string)))

(defmacro trans-install-target-popup-function (target)
  "Give translate target, install the interactive command, trans-input-target-popup"
  
  `(defun ,(intern (format "trans-input-%s-popup" target)) (text)
     ,(format "translate input text to target %s" target)
     (interactive "sEnter your source text: ")
          (let* ( (text (escape-doublequotes text))
                  (trans-string (trans-no-check-id trans-verbose-p trans-source ,(format "%s" target ) text))
                  )
    (trans-popup trans-string)
    (kill-new trans-string)
    (trans-save-to-buffer trans-string)
    trans-string))
  )

(defun trans-install-target (target)
  "Give translate target, install the interactive command : trans-input-target , trans-input-target-popup"
  
  
  (trans-eval-string (concat "(trans-install-target-popup-function " "\"" target  "\" "  ")"))
  (trans-eval-string (concat "(trans-install-target-function " "\"" target  "\" "  ")"))
(message (format "generate two new functions : %s, %s" (concat "trans-input-" target) (concat "trans-input-" target "popup"))))


(define-minor-mode trans-mode
  "Toggles global trans-mode"
  :init-value nil
  :global t
  :group 'trans-mode
  :lighter " trans"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c C-t r") 'trans-region-or-clipboard) 
            (define-key map (kbd "C-c C-t R") 'trans-region-or-clipboard-popup) 
            (define-key map (kbd "C-c C-t i") 'trans-input) 
            (define-key map (kbd "C-c C-t I") 'trans-input-popup) 
            (define-key map (kbd "C-c C-t v") 'trans-toggle-verbose) 
            (define-key map (kbd "C-c C-t b") 'trans-switch-to-buffer) 
            map))


(provide 'trans-mode)
