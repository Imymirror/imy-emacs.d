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
;; completion system

;; modal
;;(require 'init-ryo-modal)
(require 'init-meow)
;; modal


;; language
(require 'init-lsp)
(require 'yasnippet)
;; language


(require 'init-mode-enable)

(require 'init-custom)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(meow yasnippet winum which-key telega smartparens selectrum-prescient ryo-modal rg persp-mode org-roam org-download org-bullets magit lsp-mode link-hint grab-mac-link expand-region doom-modeline ctrlf crux consult company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
