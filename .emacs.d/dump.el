;; dump.el -*- lexical-binding: t; -*-

(setq luna-dumped t)

(load (expand-file-name "early-init.el" user-emacs-directory))
(load (expand-file-name "dump-entry.el" user-emacs-directory))

(setq evil-want-keybinding nil) 

;; (let ((default-directory imy/package-install-dir))
;;    (normal-top-level-add-subdirs-to-load-path))

(require 'package)
(setq package-user-dir imy/package-install-dir)
;;(setq package-enable-at-startup nil)

;; load autoload files and populate load-path’s
(package-initialize)

(dolist (package '(

		     command-log-mode doom-themes company writeroom-mode general visual-fill-column rainbow-identifiers yasnippet undo-fu org-bullets evil-nerd-commenter evil evil-collection magit projectile ivy org-roam org-roam-server grab-mac-link link-hint ripgrep counsel-projectile ivy-rich winum amx org-download rainbow-delimiters paredit which-key gcmh org-make-toc lsp-mode evil-surround ace-pinyin pinyinlib typescript-mode lsp-ui expand-region mood-line minions posframe rime org-journal unicode-fonts treemacs treemacs-evil treemacs-projectile ox-hugo elfeed elfeed-org org-super-agenda 

afternoon-theme  ample-theme leuven-theme plan9-theme twilight-bright-theme moe-theme flatui-theme  flucui-themes espresso-theme soft-stone-theme minimal-theme  darktooth-theme apropospriate-theme tao-theme   hc-zenburn-theme jazz-theme naquadah-theme  darkburn-theme  soothe-theme clues-theme  spacegray-theme planet-theme  seti-theme badwolf-theme darkmine-theme kaolin-themes    gruber-darker-theme subatomic-theme  nimbus-theme  atom-one-dark-theme green-is-the-new-black-theme organic-green-theme green-phosphor-theme 

))

(require package))

(setq luna-dumped-load-path load-path)

;; dump image
(dump-emacs-portable "~/.emacs.d/emacs.pdmp")
