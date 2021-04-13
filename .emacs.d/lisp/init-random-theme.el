;; init-random-theme.el -*- lexical-binding: t; -*-

(load-theme 'doom-dracula t)

;; (add-to-list 'load-path (concat imy/package-manual-dir "theme"))
(add-to-list 'load-path (concat imy/package-manual-dir "rand-theme"))

(require 'rand-theme)

;; Themes I never want to be selected
(setq rand-theme-unwanted '(doom-nord-light tsdh-dark))

;; dark : kaolin-mono-dark kaolin-mono-light  darktooth

(setq wanted-theme '(
		       ;; dark
		       ;;  doom-snazzy doom-gruvbox  

		       ;; light
		       
		       ))

(setq rand-theme-wanted wanted-theme)


;; (rand-theme)


(provide 'init-random-theme)
