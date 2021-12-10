;;  -*- lexical-binding: t; -*-

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(require 'init-speedup)
(require 'init-some-path)
(require 'init-imi-func)
(require 'init-basic)
(require 'init-platform)
(require 'init-package)

;; package
(require 'init-roam)
(require 'init-org-mode)
(require 'init-telega)
(require 'init-gtd)
(require 'init-doom)
(require 'init-winum)
(require 'init-org-download)
(require 'init-persp)
;; package

;; completion system
(require 'init-selectrum)
(require 'init-consult)
(require 'init-rg)


;; modal
;;(require 'init-ryo-modal)
(require 'init-meow)

;; language
(require 'init-lsp)
(require 'yasnippet)

(require 'init-mode-enable)

(require 'init-custom)


