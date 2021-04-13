;; init-org-mode.el -*- lexical-binding: t; -*-

;; 截图黏贴到 org 文件里
(require 'grab-mac-link)
(setq grab-mac-link-dwim-favourite-app 'chrome)


(setq org-src-preserve-indentation nil ;; 代码永久地保存固定不缩进
      org-edit-src-content-indentation 0) ;; 如果 org-src-preserve-indentation 为nil , 代码缩进值

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) 
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode t)
	    (rainbow-delimiters-mode t)
	    (show-paren-mode 1)
	    ))

(add-hook 'lisp-interaction-mode
	  (lambda ()
	    (paredit-mode t)
	    (rainbow-delimiters-mode t)
	    (show-paren-mode 1)
	    ))

(add-hook 'after-change-major-mode-hook
	  (lambda ()
	    (modify-syntax-entry ?_ "w")))

(setq org-M-RET-may-split-line '((item . nil)))


(defun imy/org-global-prop( name )
  "Get the value from the global property with the given name, e.g. 'AUTHOR', 'TITLE', etc."
  (save-excursion
    (outline-show-all)
    (goto-line 0)
    (if (re-search-forward (concat "^#\\+" name ":") nil t)
	(progn
	  (setq start (point))
	  (re-search-forward "$")
	  (setq end (point))
	  (string-trim (buffer-substring-no-properties start end))))
    ))

(defun imy/org-mode-rename-buffer ()
  (interactive)
  (when (eq major-mode 'org-mode)
    (if (imy/org-global-prop "TITLE")
	(rename-buffer (imy/org-global-prop "TITLE")))))

(add-hook 'org-mode-hook  'imy/org-mode-rename-buffer)

(provide 'init-org-mode)
