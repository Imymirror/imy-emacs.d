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

;; use-package
(require 'init-rg)
(use-package which-key
  :straight t
  :init (which-key-mode 1))

(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;  (load-theme 'doom-rouge t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package spacemacs-theme
  :straight t
  :defer t
  :init (load-theme 'spacemacs-light t))

(use-package org-bullets :straight t)

(use-package doom-modeline
  :straight t
  :ensure t
  :init (doom-modeline-mode 1))


(require 'init-gtd)			        

;; ;; package
(require 'init-project)
(require 'init-meow)			        
(require 'init-roam)
(require 'init-org-mode)		        
(require 'init-org-download)
(require 'init-citar)
(require 'init-pomodoro)
(require 'init-automation)
(require 'init-mind-map)

;; completion system			        
(require 'init-vertico)

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  :straight t
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(require 'init-consult)		        

;; language				        
(require 'init-lsp)			        
(require 'init-tree-sitter)		        
					        
(require 'init-mode-enable)

;; from https://github.com/company-mode/company-mode/issues/14
(setq-local company-dabbrev-downcase nil)

(use-package grab-mac-link
  :straight t
  :bind ("C-c g" . grab-mac-link-dwim)
  :config
  (setq grab-mac-link-dwim-favourite-app 'chrome))

(use-package treemacs
  :straight t
  :ensure t
  :bind ("s-0" . treemacs-select-window))

(require 'init-custom)
(put 'scroll-left 'disabled nil)
