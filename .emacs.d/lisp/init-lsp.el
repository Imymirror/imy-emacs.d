;; init-lsp.el -*- lexical-binding: t; -*-

(with-eval-after-load 'lsp-mode
  (setq read-process-output-max (* 1024 1024)) ;; 1mb

  (setq lsp-completion-provider :capf)
  )

(provide 'init-lsp)
