;;  -*- lexical-binding: t; -*-

(add-to-list 'display-buffer-alist
             '("\\`\\*rg\\*\\'" .
               (display-buffer-in-side-window
                (side . right)
                ;;(window-width . 80)
		)))

(provide 'init-rg)
