;;  -*- lexical-binding: t; -*-

(require 'lsp-mode)

;; 性能相关
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
(setq lsp-enable-file-watchers nil)
(setq lsp-log-io nil) ; if set to true can cause a performance hit

(setq lsp-ui-doc-position 'at-point)

;; 补全
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2

(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook (lambda ()
			     (let ((lsp-keymap-prefix "C-c l"))
			       (lsp-enable-which-key-integration)))))


(add-hook 'c-mode-hook 'lsp)

(provide 'init-lsp)
