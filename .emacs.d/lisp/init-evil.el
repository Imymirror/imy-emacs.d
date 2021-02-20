;;; init-evil.el -*- lexical-binding: t; -*-


(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)

(require 'evil)
(evil-mode 1)

(when (require 'evil-collection nil t)
   (evil-collection-init))

(evil-collection-magit-setup)

(provide 'init-evil)
