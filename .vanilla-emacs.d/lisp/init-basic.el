;;; -*- lexical-binding: t -*-

;;(set-face-attribute 'default nil :height 140 :weight 'regular :width 'normal :family "PingFang SC")
(set-face-attribute 'default nil :height 150)
(load-theme 'dichromacy t)

(global-set-key (kbd "<f5>") (lambda() (interactive)(find-file user-init-file)))

(setq
     backup-by-copying t ; 自动备份
     backup-directory-alist
     '(("." . "~/project/vanilla-emacs/backup")) ; 自动备份在指定目录下
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 3 ; 保留最近的3个备份文件
     kept-old-versions 1 ; 保留最早的1个备份文件
     version-control t) ; 多次备份


(tool-bar-mode 0)
(scroll-bar-mode 0)
(add-to-list 'display-buffer-alist  '("*Help*" display-buffer-same-window))
(add-to-list 'default-frame-alist '(fullscreen . maximized)) 

(provide 'init-basic)
