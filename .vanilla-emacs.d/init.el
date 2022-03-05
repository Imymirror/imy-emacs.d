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

;; (require 'init-embark)

(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	    doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (load-theme 'doom-solarized-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package avy
  :straight t
  :defer 3
  :bind ("C-c g l" . avy-goto-line)
  :config
  
  (use-package doom-modeline
    :straight t
    :defer 3
    :init
    (doom-modeline-mode 1))

  (use-package consult :straight t :commands execute-extended-command)

  (use-package org-bullets :straight t :defer 4 :config (org-bullets-mode))

  ;; Enable richer annotations using the Marginalia package
  (use-package marginalia
    :straight t
    :defer 6
    ;; Either bind `marginalia-cycle` globally or only in the minibuffer
    :bind (:map minibuffer-local-map
		        ("M-A" . marginalia-cycle))
    :init (marginalia-mode))
  
  (use-package which-key
    :straight t
    :init (which-key-mode 1))

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

  (use-package ace-pinyin :straight t
    :init (ace-pinyin-global-mode +1)
    :bind ("C-c g c" . ace-pinyin-jump-char))

  (use-package grab-mac-link
    :straight t
    :bind ("C-c o g" . grab-mac-link-dwim)
    :config
    (setq grab-mac-link-dwim-favourite-app 'chrome))

  (use-package treemacs
    :straight t
    :bind ("s-0" . treemacs-select-window)
    :config (message "loading treemacs"))

  (use-package cmake-mode
    :straight t
    :mode "CMakeLists.txt"
    :config (message "loading cmake-mode"))

  (use-package magit
    :straight t
    :bind ("C-c t m" . magit)
    :config (message "magit..."))

  (use-package spacemacs-theme
    :straight t
    :commands consult-theme
    :defer t)
  
  (use-package ctrlf :straight t :init (ctrlf-mode))

  (require 'init-company)
  (require 'init-lsp)
  (use-package flycheck :ensure :straight t)
  (require 'init-rust))

(use-package emacs
  :bind (
         ("C-c t s" . shell)))

(require 'init-custom)

;;(put 'scroll-left 'disabled nil)
