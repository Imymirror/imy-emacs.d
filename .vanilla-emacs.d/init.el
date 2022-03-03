;;  -*- lexical-binding: t; -*-

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(require 'init-speedup)
(require 'init-some-path)
(require 'init-imi-func)
;;(require 'init-font)
(require 'init-basic)


(require 'init-platform)
(require 'init-straight)

;; use-package
(require 'init-rg)


(use-package which-key
  :straight t
  :bind ("C-c t w" . which-key-mode))

(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  
  (load-theme 'modus-vivendi t)

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
  :commands consult-theme
  :defer t
  ;; :init (load-theme 'spacemacs-light t)
  )

(use-package org-bullets :straight t
  :after org)

(use-package doom-modeline
  :straight t
  :ensure t)

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
;; (require 'init-mind-map)

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

;;(require 'init-consult)		        
(use-package consult :straight t
  :commands execute-extended-command )
;; (require 'init-embark)

;; language				        
(require 'init-lsp)			        
(require 'init-tree-sitter)		        
(require 'init-smartparens)
(require 'init-yasnippet)
(require 'init-link-hint)


(use-package avy
  :straight t
  :bind ("C-c g l" . avy-goto-line))

(use-package magit
  :straight t
  :bind ("C-c t m magit"))

(use-package ace-pinyin :straight t
  :init (ace-pinyin-global-mode +1)
  :bind ("C-c g c" . ace-pinyin-jump-char))


(use-package cmake-mode
  :straight t
  :mode "CMakeLists.txt")


(use-package company
  :straight t
  :commands global-company-mode
  :init
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-limit 20)
  (setq company-idle-delay 0.1)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 6)
  (setq tab-always-indent 'complete)
  ;; from https://github.com/company-mode/company-mode/issues/14
  (setq company-dabbrev-downcase nil)
  (add-to-list 'completion-styles 'initials t)
  (add-hook 'after-init-hook 'global-company-mode))
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


(use-package grab-mac-link
  :straight t
  :bind ("C-c o g" . grab-mac-link-dwim)
  :config
  (setq grab-mac-link-dwim-favourite-app 'chrome))

(use-package treemacs
  :straight t
  :ensure t
  :bind ("s-0" . treemacs-select-window))

(require 'init-mode-enable)

(require 'init-custom)
;;(put 'scroll-left 'disabled nil)
