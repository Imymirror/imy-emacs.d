
;; init-package.el -*- lexical-binding: t; -*-

(require 'package)
(setq package-user-dir imi-package-path)
(setq package-enable-at-startup nil)
(setq package-archives '(
			 ("gnu" . "http://elpa.emacs-china.org/gnu/")

;;			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
;;			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ;; ("elpy" .  "http://jorgenschaefer.github.io/packages/")
			 ))

(package-initialize)

(setq package-list '(
		     which-key org-roam  telega  ctrlf rg company smartparens  crux  avy consult  yasnippet link-hint grab-mac-link org-download  magit meow ace-pinyin ox-hugo
			       lsp-mode
			       tree-sitter tree-sitter-langs
			       selectrum selectrum-prescient  
;;persp-mode  ryo-modal winum expand-region 

			       ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
