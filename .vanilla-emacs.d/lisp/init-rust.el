;;  -*- lexical-binding: t; -*-

(use-package rustic :straight t
  :ensure
  :mode ("\\.rs\\'" . rustic-mode)
  :bind (:map rustic-mode-map
              ("C-c C-c s" . lsp-rust-analyzer-status)
              ("s-r" . rustic-cargo-run))
  :init
  (setq rustic-lsp-server 'rust-analyzer)
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  ;; (setq rustic-format-on-save nil)
  ;; (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)
  )

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

;; (setq lsp-prefer-capf t)

(provide 'init-rust)
