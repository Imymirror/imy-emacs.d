;; init-package.el -*- lexical-binding: t; -*-

(require 'package)
(setq package-user-dir imy/package-install-dir)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("elpy" .  "http://jorgenschaefer.github.io/packages/")))

(package-initialize)

(setq package-list '(
		     command-log-mode  company writeroom-mode general visual-fill-column rainbow-identifiers yasnippet undo-fu org-bullets evil-nerd-commenter evil evil-collection magit projectile ivy org-roam org-roam-server grab-mac-link link-hint ripgrep counsel-projectile ivy-rich winum amx org-download rainbow-delimiters paredit which-key gcmh org-make-toc evil-surround ace-pinyin pinyinlib typescript-mode expand-region mood-line minions posframe rime org-journal unicode-fonts treemacs treemacs-evil treemacs-projectile ox-hugo elfeed elfeed-org org-super-agenda god-mode evil-god-state windresize keycast eglot lsp-mode lsp-ui lsp-treemacs flycheck

				       ;; kaolin-themes
				       doom-themes
				      
				      ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
