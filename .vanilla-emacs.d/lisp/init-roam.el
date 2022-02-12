;; init-roam.el -*- lexical-binding: t; -*-

(setq org-roam-v2-ack t)

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))

(setq org-roam-node-display-template "${tags:35} ${title:80}" )

;; daily
(require 'org-roam-dailies)
(setq org-roam-dailies-directory imi/roam-daily-path)

;; (setq org-roam-dailies-capture-templates
;;       '(("d" "default" entry "* TODO %<%Y-%m-%d %I:%M %p>: %?"
;;          :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+TODO: TODO(t!) WAIT(w@/!) | DONE(d!) CANCELED(c@)\n"))))

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* TODO %<%Y-%m-%d %I:%M %p>: %?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))



(setq org-roam-capture-templates '(("d" "default" plain "%?" :target
  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
  :unnarrowed t)))


(defun imi/switch-to-roam-engineering (x)
  "seperate note for engineering."
  (interactive "nEnter 1:algorithm 2.rational-emacs 3.flux-compose default:engineering \n")
  (cond ((= x 1)   
	 (setq org-roam-directory "~/central-management-system/zotero/engineering/algorithm/")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/algorithm.db"))
	((= x 2)   
	 (setq org-roam-directory "~/central-management-system/zotero/engineering/rational-emacs")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/rational-emacs.db"))
	((= x 3)   
	 (setq org-roam-directory "~/central-management-system/zotero/engineering/flux-compose")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/flux-compose.db"))
	(t      ;; 默认路径
	 (setq org-roam-directory "~/central-management-system/zotero/engineering")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/engineering.db"))
	 )
  )



;; roam directory
(defun imi/switch-roam-directory (x)
  "switch roam directory : 1.original  2.memory"
  (interactive "nEnter 1.roam2 2.yinye 3.zotero/roam 4.blog 5.zettlekasten ")
  (cond ((= x 1)   
	 (setq org-roam-directory "~/central-management-system/pkm-roam/roam2")  
	 (setq org-roam-db-location "~/central-management-system/pkm-roam/roam2.db"))
	((= x 2)   
	 (setq org-roam-directory "~/central-management-system/pkm-roam/yinye")  
	 (setq org-roam-db-location "~/central-management-system/pkm-roam/roam-yinye.db"))
	((= x 3)   
	 (setq org-roam-directory "~/central-management-system/zotero/roam")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/zotero-roam.db"))
	((= x 4)   
	 (setq org-roam-directory "~/central-management-system/zotero/roam/blog/")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/zotero-blog.db"))
	((= x 5)   
	 (setq org-roam-directory "~/central-management-system/zotero/zettlekasten")  
	 (setq org-roam-db-location "~/central-management-system/zotero/roam-db/zettlekasten-emacs.db"))
	 
	(t      ;; 默认路径
	 (setq org-roam-directory "~/central-management-system/zotero/roam")  
	 (setq org-roam-db-location "~/central-management-system/zotero/zotero-roam.db"))
	 ))


(imi/switch-roam-directory 5)


(provide 'init-roam)
