;;  -*- lexical-binding: t; -*-

(defvar mac-front-app-alist nil)

(defun imi/shell-command-string(cmd)
  (let ((string (shell-command-to-string cmd) ))
    (if (equal string "") string (substring string 0 -1))))

(defun imi/shell-get-process-id(process-name)
  (interactive)
  (imi/shell-command-string (concat "/bin/echo $(pgrep -x '" process-name "')")))


(defvar process-test-sentinel-wait-timeout 2.0)

(defun imi/mac-set-app-front(process-name)

  (let* ((id (cdr (assoc process-name  mac-front-app-alist)))
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
        (setq mac-front-app-alist (assoc-delete-all process-name  mac-front-app-alist))))
    ))



(defun imi/switch-app-by-process-name(process-name)
  (interactive)

  (let ((process-id (assoc process-name  mac-front-app-alist)))

    (when (not process-id)
      (setq process-id (imi/shell-get-process-id process-name))
      ;; open app
      (when (string= "" process-id)
        (let ((output (imi/shell-command-string (concat "command -v -- " process-name )) ))
          (if (equal output "") ;; check if normal app
              (shell-command-to-string (concat "/usr/bin/open -a " process-name ))
            (start-process "osascript-getinfo" "*osascript*"  process-name "&"))))

      ;; add too alist
      (push `(,process-name . ,process-id) mac-front-app-alist))
    (imi/mac-set-app-front process-name )))

(defun imi/macfa-sioyek()
  "front mac app sioyek"
  (interactive)
  (imi/switch-app-by-process-name "sioyek"))

(defmacro imi/install-macfa (process-name)
  "Give process-name regarding macos, install the interactive command to front the app"
  `(defun  ,(intern (format "imi/macfa-%s" (downcase (replace-regexp-in-string " " "-" process-name)))) ()
       ,(format "front macs app : %s " process-name)
       (interactive)
       (imi/switch-app-by-process-name ,process-name)))

(imi/install-macfa "finder")
(imi/install-macfa "sioyek")
(imi/install-macfa "iTerm")
(imi/install-macfa "Google Chrome")
(imi/install-macfa "Zotero")

(global-set-key (kbd "C-c g s") 'imi/macfa-sioyek)
(global-set-key (kbd "C-c g i") 'imi/macfa-iterm)
(global-set-key (kbd "C-c g f") 'imi/macfa-finder)
(global-set-key (kbd "C-c g g") 'imi/macfa-google-chrome)


(provide 'init-mac-front-app)
