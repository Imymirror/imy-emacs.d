;;; init-evil.el -*- lexical-binding: t; -*-

(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor  'hbar) ; _ 


(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)

(require 'evil)
(evil-mode 1)


(when (require 'evil-collection nil t)
  (evil-collection-init))

;; (require 'evil-collection)
;; (evil-collection-init)


(require 'magit)
(evil-collection-magit-setup)

(setq-default evil-kill-on-visual-paste nil)

(require 'init-evil-multiple-cursor)

(provide 'init-evil)
