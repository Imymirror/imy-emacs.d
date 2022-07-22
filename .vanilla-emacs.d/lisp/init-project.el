;;  -*- lexical-binding: t; -*-

;; (require 'projectile)

;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

;; (projectile-mode +1)

;; ;;(setq projectile-auto-discover nil)
;; (setq projectile-project-search-path '(("~/central-management-system/project/" . 2) ("~/central-management-system/book-code" . 1)  ))


(use-package projectile   :straight t
  :init
  (projectile-mode 1)
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  ;; (when (executable-find "rg")
  ;;   (setq-default projectile-generic-command "rg --files --hidden"))
  ;; https://github.com/LambdaRan/emacs-lambda-time-machine/blob/d8116f159005625beed822bd9c0f651ddff3115b/init-projectile.el
  (when (executable-find "rg") 
    (setq projectile-generic-command
          (let ((rg-cmd ""))
            (dolist (dir projectile-globally-ignored-directories)
              (setq rg-cmd (format "%s --glob '!%s'" rg-cmd dir)))
            (concat "rg -0 --files --color=never --hidden" rg-cmd)))))

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
