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

(require 'init-theme)
(use-package which-key :straight t :init (which-key-mode 1))

(use-package avy :straight t :defer 2 :bind ("M-s-l" . avy-goto-line))

(require 'init-link-hint)

;; completion system			        
(require 'init-vertico)
(require 'init-orderless)
(use-package consult :straight t :commands execute-extended-command)
(use-package marginalia :straight t :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle)) :init (marginalia-mode) :custom   (marginalia-max-relative-age 0))
(require 'init-embark)
(use-package ctrlf :straight t :init (ctrlf-mode))



(require 'init-project)
(require 'init-rg)
(require 'init-org-download)
(require 'init-citar)
(require 'init-automation)
(require 'init-smartparens)
(require 'init-yasnippet)

(use-package ace-pinyin :straight t :init (ace-pinyin-global-mode +1) :bind ("M-s-c" . ace-pinyin-jump-char))
(use-package grab-mac-link :straight t :bind ("C-c o g" . grab-mac-link-dwim) :config (setq grab-mac-link-dwim-favourite-app 'chrome))

(use-package treemacs :straight t :bind ("s-0" . treemacs-select-window) :config (message "loading treemacs"))

(use-package flycheck :ensure :straight t)
(require 'init-company)
(require 'init-lsp)
(use-package racket-mode :straight t :defer t)
;; (require 'init-rust)

(require 'init-custom)


