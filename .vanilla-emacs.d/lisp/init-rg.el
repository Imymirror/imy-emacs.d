;;  -*- lexical-binding: t; -*-

(use-package rg
  :straight t
  :bind ("M-s-r" . rg)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*rg\\*\\'" .
		 (display-buffer-in-side-window
                  (side . right)
                  (window-width . 160)))))

(provide 'init-rg)
