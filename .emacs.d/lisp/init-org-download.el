;;; init-org-download.el -*- lexical-binding: t; -*-

(require 'org-download)

(defun imy/im-file-name ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    ;; (file-name-nondirectory (kill-new (file-truename buffer-file-name)))))
     ;; (file-name-nondirectory  (file-truename buffer-file-name))))
     (file-name-sans-extension (buffer-name))))

(defun imy/org-download-paste-clipboard (&optional use-default-filename)
  (interactive "P")

  (yas-expand-snippet (yas-lookup-snippet "insert org image attr width"))

  (setq org-download-image-dir (concat "images/" (imy/im-file-name)))
  (let ((file
         (if (not use-default-filename)
             (read-string (format "Filename [%s]: " org-download-screenshot-basename)
                          nil nil org-download-screenshot-basename)
           nil)))
(org-download-clipboard file)))

(with-eval-after-load "org"
  (setq org-download-method 'directory)
  (setq org-download-image-dir  "images/")
  (setq org-download-heading-lvl nil)
  (setq org-download-timestamp "%Y%m%d-%H%M%S_")
  (setq org-image-actual-width nil)
  (setq org-src-window-setup 'split-window-right)
  (setq org-download-annotate-function (lambda (_link) ""))
  )


(provide 'init-org-download)
