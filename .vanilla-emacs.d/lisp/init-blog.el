;;  -*- lexical-binding: t; -*-
(defun imi/blog-export ()
  "export org blog to github"
  (interactive)
  (shell-command-to-string "sh ~/.emacs.d/shell/blog-export-copy-to-org-dir.sh")
  (org-hugo-export-to-md)
  (shell-command-to-string "sh ~/.emacs.d/shell/blog-export-copy-to-github-dir.sh"))


(defun imi/blog-preview ()
  "run hugo server and open preview in browser"
  (interactive)
  (shell-command-to-string "kill -9 $(pgrep -f 'hugo server')")
  (start-process "my-process" "blog-export" "sh" "/Users/fuhongxue/.emacs.d/shell/blog-preview.sh" "/bin")
(run-with-timer 1 nil (lambda () (browse-url "http://localhost:1313"))))

(defun imi/blog-publish ()
  "publish blog online"
  (interactive)
    (start-process "my-process" "blog-export" "sh" "/Users/fuhongxue/.emacs.d/shell/blog-publish.sh" "/bin"))

(defun imi/backup-emacs ()
  "backup emacs configuration to github"
  (interactive)
  (start-process "my-process" "blog-export" "sh" "/Users/fuhongxue/.emacs.d/shell/emacs-backup.sh" "/bin"))

(provide 'init-blog)
