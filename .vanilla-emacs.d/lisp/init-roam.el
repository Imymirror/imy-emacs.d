;; init-roam.el -*- lexical-binding: t; -*-

(setq imi/second-brain-root-path (concat imi/central-management-system-root-path "second-brain/"))

(defun imi/roam-mkdir (name)
  "make a directory in roam not root directory."
  (interactive "sEnter your directory name: ")
  (let ((path (concat imi/second-brain-root-path "note/Learning-Management-System/2-zixuedaquan/" name)))
    (message "path: %s" path)
    (mkdir path)))

(defun imi/setup-roam-db (note-path name)
  (let ((directory (concat note-path name))
        (db (concat imi/second-brain-root-path "cache/" name ".db")))
     (setq org-roam-directory  directory)
     (setq org-roam-db-location db)))


(defun imi/directory-files-no-dot (DIRECTORY &optional FULL MATCH NOSORT COUNT)
  (cl-remove-if (lambda (x) (member x '("." ".." ".DS_Store" ".git" ".gitignore")))
                (directory-files DIRECTORY)))

(defun imi/switch-to-roam-root ()
  (interactive)
  (let ((directory (concat imi/second-brain-root-path "note/"))
        (db (concat imi/second-brain-root-path "cache/roam-root.db")))
    (setq org-roam-directory  directory)
    (setq org-roam-db-location db)))


(defun imi/switch-to-roam-zixue()
  (interactive)
  (let (
        (path (concat imi/second-brain-root-path "note/Learning-Management-System/"))
        (name "2-zixuedaquan"))
    (imi/setup-roam-db path name)))

(defun imi/switch-roam-engineer ()
  (interactive)
  (let* (
         (path (concat imi/second-brain-root-path "note/Learning-Management-System/2-zixuedaquan/"))
         (choices (imi/directory-files-no-dot path))
         (name (completing-read "select a roam engineering db: " choices)))
    (imi/setup-roam-db path name)))

(defun imi/switch-between-roam-root ()
  (interactive)
  (imi/switch-roam-by-path "note/Learning-Management-System/")
  )

(defun imi/switch-roam-by-path (path)
  (interactive)
  (let* (
         (path (concat imi/second-brain-root-path path))
         (choices (imi/directory-files-no-dot path))
         (name (completing-read "select a roam engineering db: " choices)))
    (imi/setup-roam-db path name)))


(use-package org-roam :straight t
  :init
  (setq org-roam-v2-ack t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n n" . org-roam-node-find)
         ;;         ("C-c n g" . org-roam-graph)
         ("C-c n g" . org-roam-ui-mode)
         ("C-c n G" . org-roam-ui-node-local)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n t" . org-roam-tag-add)
         ("C-c n m" . imi/roam-mkdir)
         ("C-c n s" . imi/switch-roam-engineer)
         ("C-c n S S" . org-roam-db-sync)
         ("C-c n S B" . imi/switch-between-roam-root)
         ("C-c n S R" . imi/switch-to-roam-root)
         ("C-c n d" . org-roam-dailies-map)

         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  ;; :bind-keymap ; defined in meow, otherwise cause a bug
  :config
  
  (add-to-list 'display-buffer-alist '("\\*org-roam\\*" (display-buffer-in-direction)   (direction . right) (window-width . 0.33) (window-height . fit-window-to-buffer)))

  ;;  (setq org-roam-node-display-template "${tags:35} ${title:80}" )
  (cl-defmethod org-roam-node-filetitle ((node org-roam-node))
    "Return the file TITLE for the node."
    (org-roam-get-keyword "TITLE" (org-roam-node-file node)))

  (cl-defmethod org-roam-node-hierarchy ((node org-roam-node))
    "Return the hierarchy for the node."
    (let ((title (org-roam-node-title node))
          (olp (org-roam-node-olp node))
          (level (org-roam-node-level node))
          (filetitle (org-roam-node-filetitle node)))
      (concat
       (if (> level 0) (concat title " @@ ") title)
       (if (> level 0) (concat filetitle "  "))
       (if (> level 1) (concat (string-join olp " > ") ""))
       )))

  (setq org-roam-node-display-template "${tags:30} ${hierarchy:*} ")

  
  ;; daily
  (require 'org-roam-dailies)
  
  (setq imi/roam-daily-path (concat imi/second-brain-root-path "note/daily-note/"))
  (setq org-roam-dailies-directory imi/roam-daily-path)
  
  (setq org-roam-dailies-capture-templates '(("d" "default" entry "* %<%Y-%m-%d %H:%M> %?" :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n#+filetags: :daily:\n"))))
  (setq org-roam-capture-templates '(("d" "default" plain "%?" :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n") :unnarrowed t)))

  (imi/switch-to-roam-zixue)
  (org-roam-db-autosync-mode 1))


(use-package org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))


(use-package consult-org-roam :straight t
  :init
                                        ;  (require 'consult-org-roam)
  ;; Activate the minor-mode
  (consult-org-roam-mode 1)
  :custom
  (consult-org-roam-grep-func #'consult-ripgrep)
  :config
  ;; Eventually suppress previewing for certain functions
  (consult-customize
   consult-org-roam-forward-links :preview-key (kbd "M-.")
   consult-org-roam-file-find :preview-key (kbd "M-.")
   org-roam-node-find :preview-key (kbd "M-.")
   consult-org-roam-backlinks :preview-key (kbd "M-.")
   org-roam-node-insert :preview-key (kbd "M-.")
   )
  :bind
  ("C-c n e" . consult-org-roam-file-find)
  ("C-c n b" . consult-org-roam-backlinks)
  ("C-c n f" . consult-org-roam-forward-links)
  ("C-c n r" . consult-org-roam-search))


(defun imi/roam-insert-timeline ()
  "insert org headline with timeline"
  (interactive)
  (end-of-buffer)
  (insert (concat "** " (format-time-string "<%Y-%m-%d %a %H:%M>") " ")))


(provide 'init-roam)
