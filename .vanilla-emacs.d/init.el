;;  -*- lexical-binding: t; -*-

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(require 'init-speedup)
(require 'init-some-path)
(require 'init-imi-func)
(require 'init-font)
(require 'init-basic)

(require 'init-platform)
(require 'init-straight)

(require 'init-meow)			        
(require 'init-roam)
(require 'init-org-mode)		        

;; completion system			        
(require 'init-vertico)
(require 'init-orderless)

(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (load-theme 'doom-rouge t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package avy :straight t :defer 2 :bind ("M-s-l" . avy-goto-line)
  :config
  
  (use-package doom-modeline :straight t :init (doom-modeline-mode 1) :config (setq doom-modeline-buffer-file-name-style 'relative-from-project))

  (use-package consult :straight t :commands execute-extended-command)

  (use-package org-superstar :straight t :after org )
  
  ;; Enable richer annotations using the Marginalia package
  (use-package marginalia :straight t :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle)) :init (marginalia-mode) :custom   (marginalia-max-relative-age 0))

(use-package all-the-icons :straight t
  :if (display-graphic-p))
  
  (use-package all-the-icons-completion
    :straight t
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))
  
  (use-package which-key :straight t :init (which-key-mode 1))

  (require 'init-gtd)			        
  (require 'init-project)
  (require 'init-rg)
  (require 'init-org-download)
  (require 'init-citar)
  (require 'init-pomodoro)
  (require 'init-automation)
  (require 'init-tree-sitter)
  (require 'init-smartparens)
  (require 'init-yasnippet)
  (require 'init-link-hint)
  
  (use-package ace-pinyin :straight t :init (ace-pinyin-global-mode +1) :bind ("M-s-c" . ace-pinyin-jump-char))

  (use-package grab-mac-link :straight t :bind ("C-c o g" . grab-mac-link-dwim) :config (setq grab-mac-link-dwim-favourite-app 'chrome))

  (use-package treemacs :straight t :bind ("s-0" . treemacs-select-window) :config (message "loading treemacs"))
  
  (use-package magit :straight t :bind ("C-c t m" . magit) :config (message "magit..."))

  (use-package spacemacs-theme :straight t :commands consult-theme :defer t)
  
  (use-package ctrlf :straight t :init (ctrlf-mode))
  
  (use-package cmake-mode :straight t :defer t :mode "CMakeLists.txt" :config (message "loading cmake-mode"))
  (use-package flycheck :ensure :straight t)
  (require 'init-company)
  (require 'init-lsp)
  (require 'init-rust)
  (require 'init-embark)

  ;; (require 'init-corfu)
  
  (use-package emacs :bind (("C-M-s" . shell)))
  (recentf-mode))

(require 'init-custom)


;; (put 'scroll-left 'disabled nil)
;; (put 'downcase-region 'disabled nil)
