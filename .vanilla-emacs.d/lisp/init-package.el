
;; init-package.el -*- lexical-binding: t; -*-

(require 'package)
(setq package-user-dir "~/project/vanilla-emacs/packages")
(setq package-enable-at-startup nil)
(setq package-archives '(
			 ("gnu" . "http://elpa.emacs-china.org/gnu/")

;;			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ;; ("elpy" .  "http://jorgenschaefer.github.io/packages/")
			 ))

(package-initialize)

(setq package-list '(
		     which-key org-roam selectrum telega selectrum-prescient ctrlf rg company smartparens winum ryo-modal crux expand-region avy consult lsp-mode yasnippet link-hint grab-mac-link org-download persp-mode magit

			       ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
