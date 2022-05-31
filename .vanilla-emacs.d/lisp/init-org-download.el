;;  -*- lexical-binding: t; -*-

;;(require 'org-download)

(defun imi/im-file-name ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    ;; (file-name-nondirectory (kill-new (file-truename buffer-file-name)))))
    ;; (file-name-nondirectory  (file-truename buffer-file-name))))
    (file-name-sans-extension (buffer-name))))

(defun imi/org-download-paste-clipboard (&optional use-default-filename)
  (interactive "P")
  
  (insert "#+ATTR_ORG: :width 500 ")

  (setq org-download-image-dir (concat "../../assets/" (imi/im-file-name)))

  ;; (let ((file
  ;;        (if (not use-default-filename)
  ;;            (read-string (format "Filename [%s]: " org-download-screenshot-basename)
  ;;                         nil nil org-download-screenshot-basename)
  ;;          nil)))
  ;;   (org-download-clipboard file))
  
  (org-download-clipboard org-download-screenshot-basename))



(use-package org-download
  :straight t
  :after org
  :init
  ;;  (with-eval-after-load "org"
    (setq org-download-method 'directory)
    (setq org-download-image-dir  "images/")
    (setq org-download-heading-lvl nil)
    (setq org-download-timestamp "%Y%m%d-%H%M%S_")
    (setq org-image-actual-width nil)
    (setq org-src-window-setup 'reorganize-frame)
    (setq org-download-annotate-function (lambda (_link) ""))
  ;;  )
  )

(provide 'init-org-download)

