;;  -*- lexical-binding: t; -*-
(require 'winum)

(setq winum-scope 'frame-local)

;; buffer
(global-set-key (kbd "s-0") #'winum-select-window-0)
(global-set-key (kbd "s-1") #'winum-select-window-1)
(global-set-key (kbd "s-2") #'winum-select-window-2)
(global-set-key (kbd "s-3") #'winum-select-window-3)
(global-set-key (kbd "s-4") #'winum-select-window-4)
(global-set-key (kbd "s-5") #'winum-select-window-5)
(global-set-key (kbd "s-6") #'winum-select-window-6)
(global-set-key (kbd "s-7") #'winum-select-window-7)
(global-set-key (kbd "s-8") #'winum-select-window-8)
(global-set-key (kbd "s-9") #'winum-select-window-9)

(provide 'init-winum)
