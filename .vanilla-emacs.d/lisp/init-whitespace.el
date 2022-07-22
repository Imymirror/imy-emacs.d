;;  -*- lexical-binding: t; -*-


(defun sanityinc/show-trailing-whitespace ()
  "Enable display of trailing whitespace in this buffer."
  (setq-local show-trailing-whitespace t))

(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook 'sanityinc/show-trailing-whitespace))

(use-package whitespace-cleanup-mode :straight t :init (global-whitespace-cleanup-mode 1)
 :config (diminish 'whitespace-cleanup-mode))

(global-set-key [remap just-one-space] 'cycle-spacing)

(provide 'init-whitespace)
