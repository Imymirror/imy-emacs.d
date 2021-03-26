;; init-package.el -*- lexical-binding: t; -*-

(require 'package)
(setq package-user-dir imy/package-install-dir)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("elpy" .  "http://jorgenschaefer.github.io/packages/")))

(package-initialize)

(setq package-list '(command-log-mode doom-themes company writeroom-mode general visual-fill-column rainbow-identifiers yasnippet undo-fu org-bullets evil-nerd-commenter evil evil-collection magit projectile ivy org-roam org-roam-server grab-mac-link link-hint ripgrep counsel-projectile ivy-rich winum amx org-download rainbow-delimiters paredit which-key gcmh org-make-toc lsp-mode evil-surround ace-pinyin pinyinlib typescript-mode lsp-ui expand-region mood-line minions posframe rime org-journal unicode-fonts treemacs treemacs-evil treemacs-projectile 
afternoon-theme spacemacs-theme ample-theme leuven-theme plan9-theme twilight-bright-theme moe-theme flatui-theme  flucui-themes
				      
				      ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-package)
