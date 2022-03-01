;;  -*- lexical-binding: t; -*-

(use-package lsp-mode
  :straight t
  :commands lsp
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq company-idle-delay 0) ;; default 0.2
  (setq company-minimum-prefix-length 1))

(provide 'init-lsp)
