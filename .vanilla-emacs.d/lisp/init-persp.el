;;  -*- lexical-binding: t; -*-

(require 'persp-mode) 

(persp-mode 1)

(setq persp-auto-save-opt 0)

(defun imi-persp-switch-to-0 () (interactive) (imi-persp-switch-to-n 0))
(defun imi-persp-switch-to-1 () (interactive) (imi-persp-switch-to-n 1))
(defun imi-persp-switch-to-2 () (interactive) (imi-persp-switch-to-n 2))
(defun imi-persp-switch-to-3 () (interactive) (imi-persp-switch-to-n 3))
(defun imi-persp-switch-to-4 () (interactive) (imi-persp-switch-to-n 4))
(defun imi-persp-switch-to-5 () (interactive) (imi-persp-switch-to-n 5))
(defun imi-persp-switch-to-6 () (interactive) (imi-persp-switch-to-n 6))
(defun imi-persp-switch-to-7 () (interactive) (imi-persp-switch-to-n 7))
(defun imi-persp-switch-to-8 () (interactive) (imi-persp-switch-to-n 8))
(defun imi-persp-switch-to-9 () (interactive) (imi-persp-switch-to-n 9))
(defun imi-persp-switch-to-10 () (interactive) (imi-persp-switch-to-n 10))

(persp-load-state-from-file (concat persp-save-dir "01-imi-persp-auto-save.persp"))

(provide 'init-persp)
