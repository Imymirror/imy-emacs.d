;;  -*- lexical-binding: t; -*-

(require 'lsp-mode)

;;(require 'ccls)
;;(setq ccls-executable "/usr/local/bin/ccls")

;; 性能相关
;;(setq read-process-output-max (* 1024 1024)) ;; 1mb
;;(setq lsp-completion-provider :capf)
;;(setq lsp-idle-delay 0.500)
;;(setq lsp-enable-file-watchers nil)
;;(setq lsp-log-io nil) ; if set to true can cause a performance hit

;; (setq lsp-ui-doc-position 'at-point)

;;(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
;;(with-eval-after-load 'lsp-mode
;;  (add-hook 'lsp-mode-hook (lambda ()
;;			     (let ((lsp-keymap-prefix "C-c l"))
;;			       (lsp-enable-which-key-integration)))))


(setq lsp-headerline-breadcrumb-enable nil)

;; Company mode
(setq company-idle-delay 0) ;; default 0.2
(setq company-minimum-prefix-length 1)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)


(provide 'init-lsp)
