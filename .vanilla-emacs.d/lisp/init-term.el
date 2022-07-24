;;  -*- lexical-binding: t; -*-

; (require 'init-visit-term)


;; C-p  x v projectile run vterm in root
(use-package vterm :straight t :ensure t
  :load-path (lambda () (expand-file-name (concat user-emacs-directory "site-lisp" "/emacs-libvterm")))
  :bind (("M-s-s" . vterm)))

(provide 'init-term)
