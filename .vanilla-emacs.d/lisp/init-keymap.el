;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "C-M-s-)") 'telega) 

(global-set-key (kbd "C-c C-c C-l")  'consult-line)
(global-set-key (kbd "C-c C-c C-b")  'consult-buffer)
(global-set-key (kbd "C-c C-c C-M-l")  'consult-goto-line)
(global-set-key (kbd "C-c C-c C-i")  'consult-imenu)
(global-set-key (kbd "C-c C-c C-s")  'consult-ripgrep)
(global-set-key (kbd "C-c C-c C-M-s")  'consult-git-grep)
(global-set-key (kbd "C-c C-c C-f")  'consult-find)
(global-set-key (kbd "C-c C-c C-r")  'consult-recent-file)

(global-set-key (kbd "C-c C-f C-n")  'make-frame)
(global-set-key (kbd "C-c C-f C-d")  'delete-frame)

(global-set-key (kbd "C-c C-w C-m")  'delete-other-windows)
(global-set-key (kbd "C-c C-w C-w")  'other-window)
(global-set-key (kbd "C-c C-w C-r")  'imi-window-jump-right)
(global-set-key (kbd "C-c C-w C-b")  'imi-window-jump-below)
(global-set-key (kbd "C-c C-w C-d")  'delete-window)
(global-set-key (kbd "C-c C-w C-h")  'windmove-left)
(global-set-key (kbd "C-c C-w C-l")  'windmove-right)
(global-set-key (kbd "C-c C-w C-j")  'windmove-down)
(global-set-key (kbd "C-c C-w C-k")  'windmove-up)

;; roam/org
(global-set-key (kbd "C-c C-n C-n")  'org-roam-node-find)
(global-set-key (kbd "C-c C-n C-t")  'org-roam-tag-add)
(global-set-key (kbd "C-c C-n C-i")  'org-roam-node-insert)

;; buffer
(global-set-key (kbd "C-c C-b C-b") 'switch-to-buffer)
(global-set-key (kbd "C-c C-b C-k") 'kill-this-buffer)
(global-set-key (kbd "C-c C-b C-p") 'previous-buffer)
(global-set-key (kbd "C-c C-b C-n") 'next-buffer)
(global-set-key (kbd "C-c C-b C-s") 'imi-save-all-buffers)

;; toogle
(global-set-key (kbd "C-c C-; C-I") 'imi-open-iTerm)
(global-set-key (kbd "C-c C-; C-i") 'imi-org-download-paste-clipboard)
(global-set-key (kbd "C-c C-; C-s") 'shell)
(global-set-key (kbd "C-c C-; C-l") 'link-hint-open-link)
(global-set-key (kbd "C-c C-; C-g") 'grab-mac-link-dwim)
(global-set-key (kbd "C-c C-; C-o") 'imi-reveal-in-finder)
(global-set-key (kbd "C-c C-; C-b") 'persp-switch-to-buffer)


(global-set-key (kbd "C-c C-0") 'imi-persp-switch-to-0)
(global-set-key (kbd "C-c C-1") 'imi-persp-switch-to-1)
(global-set-key (kbd "C-c C-2") 'imi-persp-switch-to-2)
(global-set-key (kbd "C-c C-3") 'imi-persp-switch-to-3)
(global-set-key (kbd "C-c C-4") 'imi-persp-switch-to-4)
(global-set-key (kbd "C-c C-5") 'imi-persp-switch-to-5)

 
(provide 'init-keymap)
