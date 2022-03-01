;;  -*- lexical-binding: t; -*-

;; (require 'projectile)

;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

;; (projectile-mode +1)

;; ;;(setq projectile-auto-discover nil)
;; (setq projectile-project-search-path '(("~/central-management-system/project/" . 2) ("~/central-management-system/book-code" . 1)  ))


(use-package projectile
  :straight t
  :bind-keymap ("s-p" . projectile-command-map))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; project.el					        ;;
;; (defun imi/project-vc-override (dir)			        ;;
;;   (let ((override (locate-dominating-file dir ".project")))  ;;
;;     (if override					        ;;
;;         (cons 'vc override)				        ;;
;;       nil)))						        ;;
;; 							        ;;
;; (add-hook 'project-find-functions #'imi/project-vc-override) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'init-project)
