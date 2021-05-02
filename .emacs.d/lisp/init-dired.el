;; init-dired.el -*- lexical-binding: t; -*-

(require 'dired)

;; dired 
(setq dired-dwim-target nil)
(setq delete-by-moving-to-trash t)

(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode)))

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file

(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory

(provide 'init-dired)
