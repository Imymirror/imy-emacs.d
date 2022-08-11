;;  -*- lexical-binding: t; -*-

(defvar macfa-front-app-alist nil)
(make-variable-buffer-local 'macfa-front-app-alist)

(defun macfa/shell-command-string(cmd)
  (let ((string (shell-command-to-string cmd) ))
    (if (equal string "") string (substring string 0 -1))))

(defun macfa/shell-get-process-id(process-name)
  (macfa/shell-command-string (concat "/bin/echo $(pgrep -x '" process-name "')")))


(defvar process-test-sentinel-wait-timeout 2.0)

(defun macfa/mac-set-app-front(process-name)

  (let* ((id (cdr (assoc process-name  macfa-front-app-alist)))
         (script  (concat
                   "tell application \"System Events\"\n"
                   "set frontmost of the first process whose unix id is " id " to true\n"
                   "end tell\n")) 

         ;; (stdout-output nil)
         (proc (start-process "osascript-getinfo" "*osascript*" "osascript" "-e" script))
         (sentinel-output nil)

         (sentinel-called nil)
         (start-time (float-time)))

    
    (set-process-sentinel proc (lambda (proc msg)
                                 (push msg sentinel-output)
                                 (setq sentinel-called t)))

    (while (not (or sentinel-called
        	    (> (- (float-time) start-time)
        	       process-test-sentinel-wait-timeout)))
      (accept-process-output))

    (when (not (equal "finished\n" (mapconcat #'identity (nreverse sentinel-output) "")))
      (progn 
        (setq macfa-front-app-alist (assoc-delete-all process-name  macfa-front-app-alist))))
    ))



(defun macfa/switch-app-by-process-name(process-name)
  (let ((process-id (assoc process-name  macfa-front-app-alist)))

    (when (not process-id)
      (setq process-id (macfa/shell-get-process-id process-name))
      ;; open app
      (when (string= "" process-id)
        (let ((output (macfa/shell-command-string (concat "command -v -- " process-name )) ))
          (if (equal output "") ;; check if normal app
              (shell-command-to-string (concat "/usr/bin/open -a " process-name ))
            (start-process "osascript-getinfo" "*osascript*"  process-name "&"))))

      ;; add too alist
      (push `(,process-name . ,process-id) macfa-front-app-alist))
    (macfa/mac-set-app-front process-name )))


(defmacro macfa/install-macfa (process-name &optional rename)
  "Give process-name regarding macos, install the interactive command to front the app"
  (let ((func-name (if rename rename process-name)))
    `(defun  ,(intern (format "macfa-%s" (downcase (replace-regexp-in-string " " "-" func-name)))) ()
       ,(format "front macs app : %s " func-name)
       (interactive)
       (macfa/switch-app-by-process-name ,process-name))))

;; (defcustom macfa-keymap-prefix "C-c s"
;;   "The prefix for macfa-mode key bindings."
;;   :type 'string
;;   :group 'macfa)

;; (defun macfa--key (key)
;;   (kbd (concat macfa-keymap-prefix " " key)))

(define-minor-mode macfa-mode
  "Toggles global macfa-mode."
  :init-value nil
  :global t
  :group 'macfa
  :lighter " macfa"
  :keymap (make-sparse-keymap))


(provide 'macfa-mode)
