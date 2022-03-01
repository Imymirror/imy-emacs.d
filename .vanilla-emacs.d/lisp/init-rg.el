;;  -*- lexical-binding: t; -*-

(add-to-list 'display-buffer-alist
             '("\\`\\*rg\\*\\'" .
               (display-buffer-in-side-window
                (side . right)
                (window-width . 160)
		)))


(use-package rg
  :straight t
  :bind ("C-c s" . rg))

(provide 'init-rg)
