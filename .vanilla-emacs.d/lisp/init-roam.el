;; init-roam.el -*- lexical-binding: t; -*-

(setq org-roam-v2-ack t)

(setq org-roam-node-display-template "${tags:35} ${title:80}" )

;; daily
(require 'org-roam-dailies)
(setq org-roam-dailies-directory imi/roam-daily-path)

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* TODO %<%Y-%m-%d %I:%M %p>: %?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+TODO: TODO(t!) WAIT(w@/!) | DONE(d!) CANCELED(c@)\n"))))

;; roam directory
(defun imi/switch-roam-directory (x)
  "switch roam directory : 1.original  2.memory"
  (interactive "nEnter 1.roam2 2.memory: ")
  (cond ((= x 1)   
	 (setq org-roam-directory "~/central-management-system/pkm-roam/roam2")  
	 (setq org-roam-db-location "~/central-management-system/pkm-roam/roam2.db"))
	((= x 2)   
	 (setq org-roam-directory "~/central-management-system/pkm-roam/yinye")  
	 (setq org-roam-db-location "~/central-management-system/pkm-roam/roam-yinye.db"))
	((= x 3)   
	 (setq org-roam-directory "~/central-management-system/zotero/roam")  
	 (setq org-roam-db-location "~/central-management-system/zotero/zotero-roam.db"))
	((= x 4)   
	 (setq org-roam-directory "~/central-management-system/zotero/roam/blog/")  
	 (setq org-roam-db-location "~/central-management-system/zotero/zotero-blog.db"))
	 
	(t      ;; 默认路径
	 (setq org-roam-directory "~/central-management-system/zotero/roam")  
	 (setq org-roam-db-location "~/central-management-system/zotero/zotero-roam.db"))
	 ))


(imi/switch-roam-directory 3)

;; (setq org-roam-directory "~/central-management-system/pkm-roam/roam0")
;; (setq org-roam-db-location "~/central-management-system/pkm-roam/roam0.db")
;; (setq org-roam-directory "~/central-management-system/pkm-roam/memory")
;; (setq org-roam-db-location "~/central-management-system/pkm-roam/roam-memory.db")
(defun imi/switch-to-blog() (interactive) (imi/switch-roam-directory 4))


(defun imi/switch-to-roam2() (interactive) (imi/switch-roam-directory 1))
(global-set-key (kbd "<f7>") 'imi/switch-to-roam2)
(defun imi/switch-to-roam-memory () (interactive) (imi/switch-roam-directory 2))
(global-set-key (kbd "<f8>") 'imi/switch-to-roam-memory)
(defun imi/switch-to-roam-yinye () (interactive) (imi/switch-roam-directory 3))
(global-set-key (kbd "<f9>") 'imi/switch-to-roam-yinye)

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

(provide 'init-roam)
