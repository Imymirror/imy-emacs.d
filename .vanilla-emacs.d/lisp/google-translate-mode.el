;;; google-translate-mode.el --- Google Translate minor mode

;; This file is distributed as part of translate-shell
;; URL: https://github.com/soimort/translate-shell
;; Last-Updated: 2015-04-08 Wed

;; This is free and unencumbered software released into the public domain.

;;; Code:

(defcustom trans-command "trans"
  "trans command name."
  :type 'string
  :group 'google-translate-mode)

(defcustom trans-verbose-p nil
  "Is in verbose mode. (default: nil)"
  :type 'boolean
  :group 'google-translate-mode)

(defcustom trans-source "auto"
  "Source language. (default: auto)"
  :type 'string
  :group 'google-translate-mode)

(defcustom trans-target "zh"
  "Target language. (default: en)"
  :type 'string
  :group 'google-translate-mode)

(defcustom trans-second-target "en"
  "when input text code id equal trans-target, use trans-second-target. (default: en)"
  :type 'string
  :group 'google-translate-mode)


(defun trans-shell-identify(text)
  "shell-command about check Language Identification"
  (shell-command-to-string  (concat trans-command " -id " "\'" text "\'" " | sed '5!d' | awk -F ' ' '{print $2}' | grep " trans-target )))

(defun trans-identify-p (text)
  "Language Identification."
  (interactive)
  
  (let ((check-string (trans-shell-identify text) ))
(if (equal check-string "") nil t)))


(defun trans (verbose source target text)
  (let* ((target (if (trans-identify-p text) trans-second-target target))
         (cmd-string   (concat trans-command
           (if verbose "" " -b")
           (if source (concat " -s " source) "")
           (if target (concat " -t " target) "")
           " " (concat "\"" text "\""))))
    ;; (message cmd-string)
    (shell-command-to-string cmd-string)))

(defun region-string()
  "return mark region string"
            (buffer-substring-no-properties (region-beginning) (region-end)))

(defun imi/show-trans-region()
  (interactive)
  (setq trans-target "zh")
  
  (if (region-active-p)
      (message (trans trans-verbose-p trans-source trans-target (region-string)))
    (message (trans trans-verbose-p trans-source trans-target (current-kill 0) ))))


(defun show-translation ()
  "Show translation of the current word in message buffer."
  (interactive)
  (message
   (trans trans-verbose-p trans-source trans-target (current-word))))

(defun view-translation ()
  "View verbose translation of the current word in popup dialog."
  (interactive)
  (let ((translation
         (trans t trans-source trans-target (current-word))))
    (x-popup-menu t (list "Translation"
                          (list "PANE"
                                (list translation nil))))))

(defun insert-translation ()
  "Insert translation of the current word right after."
  (interactive)
  (insert " ")
  (insert
   (trans trans-verbose-p trans-source trans-target (current-word))))

(defvar google-translate-mode-keymap
  (let
      ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c -") 'show-translation)
    (define-key map (kbd "C-c =") 'view-translation)
    (define-key map (kbd "C-c +") 'insert-translation)
    map)
  "Keymap for Google Translate minor mode.")

(define-minor-mode google-translate-mode
  "Google Translate"
  :keymap google-translate-mode-keymap)

(provide 'google-translate-mode)
