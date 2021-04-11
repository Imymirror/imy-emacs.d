;; init-temp.el -*- lexical-binding: t; -*-

(require 'grab-mac-link)
(setq grab-mac-link-dwim-favourite-app 'chrome)

(require 'winum)
(winum-mode)


;; (add-to-list 'load-path "~/.my-emacs-env/package-manual/emacs-libvterm")
;; (require 'vterm)


(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

(provide 'init-temp)
