;;  -*- lexical-binding: t; -*-

(use-package perspective :straight t
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "s-w"))  ; pick your own prefix key here
  :init
  (persp-mode)
  :config
  (global-set-key (kbd "s-1") (lambda () (interactive) (persp-switch-by-number 1)))
  (global-set-key (kbd "s-2") (lambda () (interactive) (persp-switch-by-number 2)))
  (global-set-key (kbd "s-3") (lambda () (interactive) (persp-switch-by-number 3)))
  (global-set-key (kbd "s-4") (lambda () (interactive) (persp-switch-by-number 4)))
  (global-set-key (kbd "s-5") (lambda () (interactive) (persp-switch-by-number 5))))


;; (require 'persp-mode) 
;; (persp-mode 1)

;; (defun imi/close-perspective()
;;   (message (concat "Saving " imi/persp-path ))
;;   ;; telega confict with persp, don't save
;;   (when (telega-server-live-p)  (telega-kill 1) )  
;;   (persp-save-state-to-file imi/persp-path))


;; (defun imi/persp-switch-to-n (n)
;;   (let ((names (persp-names-current-frame-fast-ordered))
;;         (count 0))
;;     (dolist (name names)
;;       (when (= count n)
;;         (persp-switch name))
;;       (cl-incf count))))


;; (defun imi/persp-switch-to-0 () (interactive) (imi/persp-switch-to-n 0))
;; (defun imi/persp-switch-to-1 () (interactive) (imi/persp-switch-to-n 1))
;; (defun imi/persp-switch-to-2 () (interactive) (imi/persp-switch-to-n 2))
;; (defun imi/persp-switch-to-3 () (interactive) (imi/persp-switch-to-n 3))
;; (defun imi/persp-switch-to-4 () (interactive) (imi/persp-switch-to-n 4))
;; (defun imi/persp-switch-to-5 () (interactive) (imi/persp-switch-to-n 5))
;; (defun imi/persp-switch-to-6 () (interactive) (imi/persp-switch-to-n 6))
;; (defun imi/persp-switch-to-7 () (interactive) (imi/persp-switch-to-n 7))
;; (defun imi/persp-switch-to-8 () (interactive) (imi/persp-switch-to-n 8))
;; (defun imi/persp-switch-to-9 () (interactive) (imi/persp-switch-to-n 9))
;; (defun imi/persp-switch-to-10 () (interactive) (imi/persp-switch-to-n 10))


(provide 'init-persp)
