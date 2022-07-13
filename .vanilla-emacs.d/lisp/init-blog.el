;;  -*- lexical-binding: t; -*-

;; (with-eval-after-load 'ox  (require 'ox-hugo))

(use-package ox-hugo :straight t
  :commands imi/blog-export
  :config
  ;; 生成 TOC
  (setq org-hugo-export-with-toc t)  )


;; (defun imi/blog-export ()
;;   "export org blog to github"
;;   (interactive)
;;   (shell-command-to-string "sh ~/.emacs.d/shell/blog-export-copy-to-org-dir.sh")
;;   (org-hugo-export-to-md)
;;   (shell-command-to-string "sh ~/.emacs.d/shell/blog-export-copy-to-github-dir.sh")
;;   (imi/blog-preview))

(defun imi/blog-export ()
  "export org blog to github"
  (interactive)
					;  (shell-command-to-string "sh ~/.emacs.d/shell/blog-export-copy-to-org-dir.sh")
  (setq blog-note-dir (concat imi/second-brain-root-path "note/blog/"))
  (shell-command (concat "rm -rf " blog-note-dir "content/*"))
  (shell-command (concat "rm -rf " blog-note-dir "static/*"))

  (setq blog-publish-dir (concat imi/central-management-system-root-path "project/blog-yinyang/blog/"))

  (shell-command (concat "cp -R " blog-publish-dir "static/" " " blog-note-dir "static/"))
  (shell-command (concat "cp -R " blog-publish-dir "content/cn/posts/" " " blog-note-dir "content/"))


  (org-hugo-export-to-md)
					;    (shell-command-to-string "sh ~/.emacs.d/shell/blog-export-copy-to-github-dir.sh")
  (shell-command (concat "cp -R " blog-note-dir "static/" " " blog-publish-dir "static/"))
  (shell-command (concat "cp -R " blog-note-dir "content/" " " blog-publish-dir "content/cn/posts/"))
  
  (imi/blog-preview))


(defun imi/blog-preview ()
  "run hugo server and open preview in browser"
  (interactive)
  (shell-command-to-string "kill -9 $(pgrep -f 'hugo server')")
  (start-process "my-process" "automation" "sh" "/Users/fuhongxue/.emacs.d/shell/blog-preview.sh" "/bin")
  (run-with-timer 1 nil (lambda () (browse-url "http://localhost:1313"))))

(defun imi/blog-publish ()
  "publish blog online"
  (interactive)
  (start-process "my-process" "automation" "sh" "/Users/fuhongxue/.emacs.d/shell/blog-publish.sh" "/bin")
  (run-with-timer 1 nil (lambda () (browse-url "https://imymirror.github.io/"))))

(provide 'init-blog)
