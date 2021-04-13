;; init-language.el -*- lexical-binding: t; -*-

;; 缩进调成 4, 默认是 2
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

(provide 'init-language)
