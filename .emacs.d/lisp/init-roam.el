;; init-roam.el -*- lexical-binding: t; -*-

(setq org-roam-buffer-width '0.25)

;; delete-other-windows 执行的时候  roam侧边栏也 delete
(setq org-roam-buffer-window-parameters nil) ;; (setq org-roam-buffer-window-parameters '((no-delete-other-windows . nil)))

;; roam find file 的时候不会自动打开 backlinks
(setq +org-roam-open-buffer-on-find-file nil)

(setq org-roam-directory "~/pkm-roam/roam0")  ;; roam 应用的文件夹
(setq org-roam-db-location "~/pkm-roam/org-roam.db")
(setq org-roam-completion-system 'ivy)

(defun start-roam-mode () (org-roam-mode t))
(add-hook 'after-init-hook 'start-roam-mode)

 (require 'org-roam-protocol)

 ;; 启动时无效, 关闭后再启动才有效

(setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 1024
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)


(setq org-roam-capture-ref-templates
      '(("r" "ref" plain (function org-roam-capture--get-point)
         ""
         :file-name "%<%Y%m%d%H%M%S>-${slug}"
         :head "#+title: ${title}\n#+roam_key: ${ref}\n#+ROAM_TAGS: webpage\n"
         :unnarrowed t)))


;; (setq org-roam-graph-extra-config '(
;;                                     ;; ("overlap" . "scale")
;;                                     ("rankdir" . "RL")
;;                                     ;; ("color" . "skyblue")
;;                                     ))

(provide 'init-roam)
