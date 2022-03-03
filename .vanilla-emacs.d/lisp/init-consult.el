;;  -*- lexical-binding: t; -*-

(use-package consult :straight t )


;; 废弃 https://github.com/minad/consult/commit/116e30998ef3d97fb194edaff0854ca5a0732447
;; (setq consult-project-root-function
;;       (lambda ()
;;         (when-let (project (project-current))
;;           (car (project-roots project)))))

(provide 'init-consult)
