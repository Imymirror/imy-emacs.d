;;  -*- lexical-binding: t; -*-

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(setq imi/lisp-dir (expand-file-name (concat user-emacs-directory "lisp")))
(setq imi/site-lisp-dir (expand-file-name (concat user-emacs-directory "site-lisp")))

(add-to-list 'load-path imi/lisp-dir)
(add-to-list 'load-path imi/site-lisp-dir) ;; 第三方库


(require 'init-straight)
(require 'init-byte-compilation)


(require 'init-speedup)
(require 'init-some-path)
(require 'init-imi-func)
(require 'init-modeline)


 (require 'init-benchmarking)
(require 'init-uniquify)
(require 'init-window)
(require 'init-font)
(require 'init-basic)
(require 'init-recentf)
(require 'init-meow)
 					; (require 'init-platforms)

(require 'init-roam)
(require 'init-org-mode)
(require 'init-latex)

(require 'init-theme)

(use-package avy :straight t :defer 2 :bind ("M-s-l" . avy-goto-line))
(use-package ace-pinyin :straight t :init (ace-pinyin-global-mode +1) :bind ("M-s-c" . ace-pinyin-jump-char) )

(require 'init-link-hint)

(require 'init-rg)

;; completion system
(require 'init-orderless)
(require 'init-minibuffer)
(require 'init-hippie-expand)

(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)

(use-package all-the-icons :straight t :if (display-graphic-p))

(require 'init-project)
(require 'init-org-download)
(require 'init-citar)
(require 'init-automation)
(require 'init-smartparens)
(require 'init-yasnippet)
(require 'init-which-key)

(use-package olivetti :straight t)

(require 'init-sessions)
(require 'init-editing-utils)
(require 'init-whitespace)

(use-package grab-mac-link :straight t :bind ("C-c o g" . grab-mac-link-dwim) :config (setq grab-mac-link-dwim-favourite-app 'chrome))

(use-package treemacs :straight t :bind ("s-0" . treemacs-select-window))
(use-package flycheck :ensure :straight t)
(require 'init-company)
(require 'init-lsp)
(require 'init-racket)
(require 'init-rust)


(use-package cmake-mode
  :load-path "site-lisp/cmake-mode"
  ;; :mode (("\\.cmake\\'" . cmake-mode)
  ;;        ("\\CMakeLists.txt$" . cmake-mode))
  )

(require 'init-telega)
(require 'init-keyboard-macro)

(require 'init-second-choice)
(require 'init-emacs)
(use-package magit :straight t :bind (("C-M-s-(" . magit)))
(require 'init-search-engine)

(use-package crux :straight t)
(require 'init-term)



(require 'init-custom)
(put 'narrow-to-region 'disabled nil)

;; (use-package cmake-mode :straight t)
