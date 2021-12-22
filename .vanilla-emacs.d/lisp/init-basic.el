;;; -*- lexical-binding: t -*-

;; Open links in the same Window by default.
(setq org-link-frame-setup '((file . find-file)))

(global-set-key (kbd "<f5>") (lambda() (interactive)(find-file user-init-file)))

(setq
     backup-by-copying t ; 自动备份
     backup-directory-alist
     `(("." . ,imi-backup-path)) ; 自动备份在指定目录下
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 3 ; 保留最近的3个备份文件
     kept-old-versions 1 ; 保留最早的1个备份文件
     version-control t) ; 多次备份


(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(add-to-list 'display-buffer-alist  '("*Help*" display-buffer-same-window))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(setq default-truncate-lines t) ;; not work
;; make side by side buffers function the same as the main window
;;(setq truncate-partial-width-windows nil)
;;(add-hook 'org-mode-hook '(lambda () (toggle-truncate-lines nil) ))


(setq display-time-24hr-format t)
;;(setq display-time-format "%I:%M")

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


(provide 'init-basic)
