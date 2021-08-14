;; init-roam2.el -*- lexical-binding: t; -*-

(setq org-roam-v2-ack t)

(setq org-roam-buffer-width '0.25)

(add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                  (display-buffer-in-direction)
                  (direction . right)
                  (window-width . 0.33)
                  (window-height . fit-window-to-buffer)))


;; delete-other-windows 执行的时候  roam侧边栏也 delete
(setq org-roam-buffer-window-parameters nil) ;; (setq org-roam-buffer-window-parameters '((no-delete-other-windows . nil)))

;; roam find file 的时候不会自动打开 backlinks
(setq +org-roam-open-buffer-on-find-file nil)

(setq org-roam-directory "~/pkm-roam/roam2")  ;; roam 应用的文件夹
(setq org-roam-db-location "~/pkm-roam/roam2-org-roam.db")

;;(setq org-agenda-text-search-extra-files (directory-files-recursively org-roam-directory "\\.org$")
(setq org-roam-completion-everywhere t)


(setq org-roam-completion-system 'ivy)

(require 'org-roam-protocol)

 ;; roam map 
(general-create-definer roam-leader-def :prefix ";")

(roam-leader-def 'normal 'override  ";" 'org-roam-node-find)
(roam-leader-def 'normal 'override  "f" 'evil-repeat-find-char)
(roam-leader-def 'normal 'override  "t" 'org-roam-tag-add)
(roam-leader-def 'normal 'override  "b" 'org-roam-buffer)
(roam-leader-def 'normal 'override  "B" 'org-roam-buffer-toggle)
(roam-leader-def 'normal 'override  "c" 'org-roam-capture)
(roam-leader-def 'normal 'override  "a" 'org-roam-alias-add)
(roam-leader-def 'normal 'override  "g" 'org-roam-graph)
(roam-leader-def 'normal 'override  "i" 'org-roam-node-insert)

(defun my-after-save-actions ()
  "Used in `after-save-hook'."
  (org-roam-db-sync)
  )
(add-hook 'after-save-hook 'my-after-save-actions)


(cl-defmethod org-roam-node-directories ((node org-roam-node))
  (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (format "(%s)" (car (f-split dirs)))
    ""))

(cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
  (let* ((count (caar (org-roam-db-query
                       [:select (funcall count source)
                                :from links
                                :where (= dest $s1)
                                :and (= type "id")]
                       (org-roam-node-id node)))))
    (format "[%d]" count)))


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
     (if (> level 0) (concat filetitle " > "))
     (if (> level 1) (concat (string-join olp " > ") " > "))
     title))
  )

(setq org-roam-node-display-template "${tags:20} ${hierarchy:*} ${backlinkscount:6}")

(require 'websocket)
(add-to-list 'load-path (concat imy/package-manual-dir "org-roam-ui"))
(load-library "org-roam-ui")


(defun org-hide-properties ()
  "Hide all org-mode headline property drawers in buffer. Could be slow if it has a lot of overlays."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward
            "^ *:properties:\n\\( *:.+?:.*\n\\)+ *:end:\n" nil t)
      (let ((ov_this (make-overlay (match-beginning 0) (match-end 0))))
        (overlay-put ov_this 'display "")
        (overlay-put ov_this 'hidden-prop-drawer t))))
  (put 'org-toggle-properties-hide-state 'state 'hidden))

(defun org-show-properties ()
  "Show all org-mode property drawers hidden by org-hide-properties."
  (interactive)
  (remove-overlays (point-min) (point-max) 'hidden-prop-drawer t)
  (put 'org-toggle-properties-hide-state 'state 'shown))

(defun org-toggle-properties ()
  "Toggle visibility of property drawers."
  (interactive)
  (if (eq (get 'org-toggle-properties-hide-state 'state) 'hidden)
      (org-show-properties)
    (org-hide-properties)))

;; (add-hook 'org-mode-hook 'org-hide-properties)

(provide 'init-roam2)
