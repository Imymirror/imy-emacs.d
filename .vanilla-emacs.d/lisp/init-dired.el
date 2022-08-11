;;  -*- lexical-binding: t; -*-


(use-package diredfl :straight t
  :config
  (with-eval-after-load 'dired
    (setq-default dired-dwim-target t)
    (diredfl-global-mode)
    (require 'dired-x)
    (define-key dired-mode-map "O" 'open-file-or-directory-in-external-app)
    (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode)))

(provide 'init-dired)
