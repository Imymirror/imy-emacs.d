;;  -*- lexical-binding: t; -*-

(defvar imi/ebook-process-id nil)
(defvar imi/process-name "zathura")

(defun imi/get-ebook-process-id()
  (interactive)
  
  (substring 
   (shell-command-to-string (concat "/bin/echo $(pgrep -x '" imi/process-name "')"))
   0 -1))


(defvar process-test-sentinel-wait-timeout 2.0)

(defun imi/mac-set-app-front-by-id(id)
  (let ((script
         (concat
          "tell application \"System Events\"\n"
          "set frontmost of the first process whose unix id is " id " to true\n"
          "end tell\n"
          )))

    (let (
          (proc (start-process "osascript-getinfo" "osascript1" "osascript" "-e" script))
          ;; (stdout-output nil)
          (sentinel-output nil)

          (sentinel-called nil)
          (start-time (float-time))
          )
      ;; (set-process-filter proc (lambda (proc input)
      ;; (message (concat "ttt: " input))
      ;; (push input stdout-output)))
      

      (set-process-sentinel proc (lambda (proc msg)
                                   (push msg sentinel-output)
                                   (setq sentinel-called t)))

      (while (not (or sentinel-called
        	      (> (- (float-time) start-time)
        	         process-test-sentinel-wait-timeout)))
        (accept-process-output))
      
      (when (not (equal "finished\n" (mapconcat #'identity (nreverse sentinel-output) ""))) (progn (setq imi/ebook-process-id nil) (imi/switch-to-ebook-viewer))))))

(defun imi/switch-to-ebook-viewer()
  (interactive)
  (or imi/ebook-process-id (progn
                             (when (string= "" (imi/get-ebook-process-id)) (start-process "osascript-getinfo" nil imi/process-name))
                             (setq imi/ebook-process-id (imi/get-ebook-process-id))) )

  (imi/mac-set-app-front-by-id imi/ebook-process-id))

(global-set-key (kbd "C-c o e") 'imi/switch-to-ebook-viewer)


(provide 'init-mac-front-app)
