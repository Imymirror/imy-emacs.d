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


(setq imi/central-management-system-root-path "~/central-management-system/")

(defun imi/setup-roam-db (name)
  (let ((directory (concat imi/central-management-system-root-path "zotero/notes/" name))
	  (db (concat imi/central-management-system-root-path "zotero/roam-db/" name ".db")))
      (setq org-roam-directory  directory)  
      (setq org-roam-db-location db))
  )

(defun imi/switch-roam-engineer ()
  (interactive)
  (let* ( (choices '("algorithm" "rational-emacs" "flux-compose" "english" "chenhao" "zettlekasten" "pkm-roam" "roam"))
	  (name (completing-read "select a roam engineering db: " choices)))
    (imi/setup-roam-db name)))

(imi/setup-roam-db "zettlekasten")

(provide 'init-roam)
