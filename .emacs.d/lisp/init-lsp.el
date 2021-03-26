;; init-lsp.el -*- lexical-binding: t; -*-

(with-eval-after-load 'lsp-mode
  (
    (setq read-process-output-max (* 1024 1024)) ;; 1mb
    (setq lsp-completion-provider :capf)
    (setq lsp-idle-delay 0.500)
    (setq lsp-enable-file-watchers nil)
    (setq lsp-log-io nil) ; if set to true can cause a performance hit
  )

(provide 'init-lsp)
