;;  -*- lexical-binding: t; -*-

(require 'persp-mode) 

(defun imi/close-perspective()
  (message (concat "Saving " imi/persp-path ))
  ;; telega confict with persp, don't save
  (when (telega-server-live-p)  (telega-kill 1) )  
  (persp-save-state-to-file imi/persp-path))


(defun imi/persp-switch-to-n (n)
  (let ((names (persp-names-current-frame-fast-ordered))
        (count 0))
    (dolist (name names)
      (when (= count n)
        (persp-switch name))
      (cl-incf count))))


(persp-mode 1)
(add-hook 'kill-emacs-hook 'imi/close-perspective)


(setq persp-auto-save-opt 0)

(defun imi/persp-switch-to-0 () (interactive) (imi/persp-switch-to-n 0))
(defun imi/persp-switch-to-1 () (interactive) (imi/persp-switch-to-n 1))
(defun imi/persp-switch-to-2 () (interactive) (imi/persp-switch-to-n 2))
(defun imi/persp-switch-to-3 () (interactive) (imi/persp-switch-to-n 3))
(defun imi/persp-switch-to-4 () (interactive) (imi/persp-switch-to-n 4))
(defun imi/persp-switch-to-5 () (interactive) (imi/persp-switch-to-n 5))
(defun imi/persp-switch-to-6 () (interactive) (imi/persp-switch-to-n 6))
(defun imi/persp-switch-to-7 () (interactive) (imi/persp-switch-to-n 7))
(defun imi/persp-switch-to-8 () (interactive) (imi/persp-switch-to-n 8))
(defun imi/persp-switch-to-9 () (interactive) (imi/persp-switch-to-n 9))
(defun imi/persp-switch-to-10 () (interactive) (imi/persp-switch-to-n 10))

(persp-load-state-from-file (concat persp-save-dir "01-imi/persp-auto-save.persp"))

(provide 'init-persp)
