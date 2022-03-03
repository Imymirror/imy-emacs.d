;;  -*- lexical-binding: t; -*-

;; bootstrap straight
(setq straight-base-dir "~/env/emacs/vanilla/straight")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" straight-base-dir))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; (setq package-list '(use-package))

;; (dolist (package package-list)
;;   (straight-use-package package))

(straight-use-package 'use-package)

(provide 'init-straight)
