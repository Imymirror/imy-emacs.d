;; init-roam.el -*- lexical-binding: t; -*-

(setq org-roam-v2-ack t)

(defun imy/switch-roam-directory (x)
  "switch roam directory : 1.original  2.memory"
  (interactive "nEnter 1.roam2 2.memory: ")
  (cond ((= x 1)   ;; 最先使用的路径
	 (setq org-roam-directory "~/pkm-roam/roam2")  
	 (setq org-roam-db-location "~/pkm-roam/roam2-org-roam.db"))
	((= x 2)   ;; memeory 路径
	 ;; (setq org-roam-directory "~/pkm-roam/memory")  
	 ;; (setq org-roam-db-location "~/pkm-roam/roam-memory-org-roam.db"))
	 (setq org-roam-directory "~/pkm-roam/roam-data")  
	 (setq org-roam-db-location "~/pkm-roam/roam-data-org-roam.db"))
	((= x 3)   ;; yinye 路径
	 (setq org-roam-directory "~/pkm-roam/yinye")  
	 (setq org-roam-db-location "~/pkm-roam/roam-yinye-org-roam.db")
	 )
	(t      ;; 默认路径
	 (setq org-roam-directory "~/pkm-roam/yinye")  
	 (setq org-roam-db-location "~/pkm-roam/roam-yinye-org-roam.db")
	 )))


(imy/switch-roam-directory 3)

(defun imy/switch-to-roam2() (interactive) (imy/switch-roam-directory 1))
(global-set-key (kbd "<f7>") 'imy/switch-to-roam2)
(defun imy/switch-to-roam-memory () (interactive) (imy/switch-roam-directory 2))
(global-set-key (kbd "<f8>") 'imy/switch-to-roam-memory)
(defun imy/switch-to-roam-yinye () (interactive) (imy/switch-roam-directory 3))
(global-set-key (kbd "<f9>") 'imy/switch-to-roam-yinye)

(provide 'init-roam)
