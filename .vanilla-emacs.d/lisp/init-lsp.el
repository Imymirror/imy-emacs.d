;;  -*- lexical-binding: t; -*-


(use-package lsp-mode
  :straight t
  :commands lsp
  :hook (
	     (c-mode . lsp)
	     (c++-mode . lsp)
         (rustic-mode . lsp))
  :bind (:map lsp-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("s-l l" . flycheck-list-errors)
              ("s-l f" . lsp-format-buffer)
              ("M-n" . flycheck-next-error)
              ("M-p" . flycheck-previous-error))
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq company-idle-delay 0) ;; default 0.2
  (setq company-minimum-prefix-length 1)


    
  ;; from https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
  (setq gc-cons-threshold (* 100 1024 1024)
	    read-process-output-max (* 1024 1024)
	    treemacs-space-between-root-nodes nil
	    company-idle-delay 0.0
	    company-minimum-prefix-length 1
	    lsp-idle-delay 0.1)  ;; clangd is fast
  
  
  ;; from https://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq indent-line-function 'insert-tab)
  
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package lsp-ui :straight t
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-enable nil))

(provide 'init-lsp)
