;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "C-M-s-)") 'telega) 

(global-set-key (kbd "C-c c C-l")  'consult-line)
(global-set-key (kbd "C-c c C-b")  'consult-buffer)
(global-set-key (kbd "C-c c C-i")  'consult-imenu)
(global-set-key (kbd "C-c c C-o")  'consult-outline)
(global-set-key (kbd "C-c c C-r")  'consult-ripgrep)
(global-set-key (kbd "C-c c g")  'consult-git-grep)
(global-set-key (kbd "C-c c C-f")  'consult-find)
(global-set-key (kbd "C-c c C-r")  'consult-recent-file)

;; frame
(global-set-key (kbd "C-c f C-n")  'make-frame)
(global-set-key (kbd "C-c f C-d")  'delete-frame)
(global-set-key (kbd "C-c f C-o")  'other-frame)

(global-set-key (kbd "C-c w m")  'delete-other-windows)
(global-set-key (kbd "C-c w C-w")  'other-window)
(global-set-key (kbd "C-c w C-r")  'imi-window-jump-right)
(global-set-key (kbd "C-c w C-b")  'imi-window-jump-below)
(global-set-key (kbd "C-c w C-d")  'delete-window)
(global-set-key (kbd "C-c w C-h")  'windmove-left)
(global-set-key (kbd "C-c w C-l")  'windmove-right)
(global-set-key (kbd "C-c w C-j")  'windmove-down)
(global-set-key (kbd "C-c w C-k")  'windmove-up)

;; roam/org
(global-set-key (kbd "C-c n C-n")  'org-roam-node-find)
(global-set-key (kbd "C-c n C-t")  'org-roam-tag-add)
(global-set-key (kbd "C-c n C-i")  'org-roam-node-insert)

;; buffer
(global-set-key (kbd "C-c b C-b") 'switch-to-buffer)
(global-set-key (kbd "C-c b C-k") 'kill-this-buffer)
(global-set-key (kbd "C-c b C-p") 'previous-buffer)
(global-set-key (kbd "C-c b C-n") 'next-buffer)
(global-set-key (kbd "C-c b C-s") 'imi-save-all-buffers)

;; toogle
(global-set-key (kbd "C-c o C-i") 'imi-open-iTerm)
(global-set-key (kbd "C-c o C-p") 'imi-org-download-paste-clipboard)
(global-set-key (kbd "C-c o C-s") 'shell)
(global-set-key (kbd "C-c o C-l") 'link-hint-open-link)
(global-set-key (kbd "C-c o C-c") 'grab-mac-link-dwim)
(global-set-key (kbd "C-c o C-o") 'imi-reveal-in-finder)
(global-set-key (kbd "C-c o C-b") 'persp-switch-to-buffer)


(global-set-key (kbd "C-c C-0") 'imi-persp-switch-to-0)
(global-set-key (kbd "C-c C-1") 'imi-persp-switch-to-1)
(global-set-key (kbd "C-c C-2") 'imi-persp-switch-to-2)
(global-set-key (kbd "C-c C-3") 'imi-persp-switch-to-3)
(global-set-key (kbd "C-c C-4") 'imi-persp-switch-to-4)
(global-set-key (kbd "C-c C-5") 'imi-persp-switch-to-5)

 
(provide 'init-keymap)
