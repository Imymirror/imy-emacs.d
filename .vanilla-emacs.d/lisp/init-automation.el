;;  -*- lexical-binding: t; -*-

;; blog 相关 export,preview,publish
(require 'init-blog)

;; 自动备份 emacs 配置
(defun imi/backup-emacs ()
  "backup emacs configuration to github"
  (interactive)
  (start-process "my-process" "automation" "sh" (concat (getenv "EMACSCFG_DIR") "/.emacs.d/shell/emacs-backup.sh")  "/bin"))


(defun imi/backup-zotero ()
  "backup emacs configuration, Programming-source-code-analysis to github"
  (interactive)
  (start-process "my-process" "automation" "sh" (concat (getenv "EMACSCFG_DIR") "/.emacs.d/shell/zotero-backup.sh")  "/bin"))



(defun imi/get-ebook-process-id()
  (interactive)
  
  (substring 
   (shell-command-to-string "/bin/echo $(pgrep -x 'zathura')") 
   0 -1))


(defvar imi/ebook-process-name nil)

(defun imi/reset-ebook-viewer()
  (interactive)
  (setq imi/ebook-process-name nil))

(defun imi/switch-to-ebook-viewer()
  (interactive)
  (or imi/ebook-process-name (progn
                               (when (string= "" (imi/get-ebook-process-id)) (start-process "osascript-getinfo" nil "zathura"))
                               (setq imi/ebook-process-name (imi/get-ebook-process-id))) )


  (let ((script
         (concat
          "tell application \"System Events\"\n"
          "set frontmost of the first process whose unix id is " imi/ebook-process-name " to true\n"
          "end tell\n"
          )))
    (start-process "osascript-getinfo" nil "osascript" "-e" script)))

(global-set-key (kbd "C-c o e") 'imi/switch-to-ebook-viewer)


(provide 'init-automation)
