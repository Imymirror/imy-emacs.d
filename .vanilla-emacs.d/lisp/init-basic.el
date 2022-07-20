;;; -*- lexical-binding: t -*-

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(setq ring-bell-function 'ignore)


;; Open links in the same Window by default.
(setq org-link-frame-setup '((file . find-file)))

(global-set-key (kbd "<f5>") (lambda() (interactive)(find-file user-init-file)))
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/env/emacs/vanilla/")))

(setq
     backup-by-copying t ; 自动备份
     backup-directory-alist
     `(("." . ,imi/backup-path)) ; 自动备份在指定目录下
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 3 ; 保留最近的3个备份文件
     kept-old-versions 1 ; 保留最早的1个备份文件
     version-control t) ; 多次备份


;;(setq inhibit-startup-screen nil)
(add-to-list 'display-buffer-alist  '("*Help*" display-buffer-same-window))

(add-to-list 'default-frame-alist '(fullscreen . maximized))


(setq display-time-24hr-format t)
;;(setq display-time-format "%I:%M")



(provide 'init-basic)
