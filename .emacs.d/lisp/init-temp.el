
;; not custom
(setq grab-mac-link-dwim-favourite-app 'chrome)

(setq link-hint-avy-style 'pre)

(require 'winum)
(winum-mode)


(add-hook 'after-init-hook 'global-company-mode)


(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
            ))

(add-hook 'lisp-interaction-mode
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
            ))

(provide 'init-temp)
