;; init-temp.el -*- lexical-binding: t; -*-

;; not custom
(setq grab-mac-link-dwim-favourite-app 'chrome)

;; (setq link-hint-avy-style 'pre)

(require 'winum)
(winum-mode)

;; (add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'load-path "~/.my-emacs-env/package-manual/emacs-libvterm")
(require 'vterm)

;; (add-to-list 'load-path "~/.my-emacs-env/package-manual/diminish")
;; (require 'diminish)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

(provide 'init-temp)
