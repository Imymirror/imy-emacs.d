;; init-language.el -*- lexical-binding: t; -*-

;; 缩进调成 4, 默认是 2
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)
	    (setq python-indent-offset 4)))

(setq typescript-indent-level 2)
(add-hook 'typescript-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (lsp-deferred)
            (hs-minor-mode 1)
            ))

(provide 'init-language)
