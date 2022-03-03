;; init-roam.el -*- lexical-binding: t; -*-

(defun imi/setup-roam-db (name)
  (let ((directory (concat imi/central-management-system-root-path "zotero/notes/" name))
	(db (concat imi/central-management-system-root-path "zotero/roam-db/" name ".db")))
    (setq org-roam-directory  directory)  
    (setq org-roam-db-location db)))


(defun imi/directory-files-no-dot (DIRECTORY &optional FULL MATCH NOSORT COUNT)
  (cl-remove-if (lambda (x) (member x '("." ".." ".DS_Store")))
		(directory-files DIRECTORY)))


(defun imi/switch-roam-engineer ()
  (interactive)
  (let* (
	 (path (concat imi/central-management-system-root-path "zotero/notes"))
	 (choices (imi/directory-files-no-dot path))	 
	 ;; (choices '("algorithm" "rational-emacs" "flux-compose" "english" "chenhao" "zettlekasten" "pkm-roam" "roam"))
	 (name (completing-read "select a roam engineering db: " choices)))
    (imi/setup-roam-db name)))

(use-package org-roam
  :straight t
  :init
  (setq imi/central-management-system-root-path "~/central-management-system/")
  (setq org-roam-v2-ack t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'init-beautify)
  (imi/setup-roam-db "roam-zettlekasten")
  (add-to-list 'display-buffer-alist '("\\*org-roam\\*" (display-buffer-in-direction)   (direction . right) (window-width . 0.33) (window-height . fit-window-to-buffer)))

  (setq org-roam-node-display-template "${tags:35} ${title:80}" )

  ;; daily
  (require 'org-roam-dailies)
  (setq org-roam-dailies-directory imi/roam-daily-path)
  (setq org-roam-dailies-capture-templates '(("d" "default" entry "* TODO %<%Y-%m-%d %I:%M %p>: %?" :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  (setq org-roam-capture-templates '(("d" "default" plain "%?" :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n") :unnarrowed t))))

(provide 'init-roam)
