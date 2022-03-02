;;  -*- lexical-binding: t; -*-

;; from https://gist.github.com/seanhagen/8421498ea363a2143afd5e73006266b0#file-yasnippet-config-el-L6


(use-package yasnippet
  :straight t
  :ensure t
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
              ("C-c C-e" . yas-expand))
  
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;;(yas-global-mode 1)
  (setq yas-prompt-functions '(yas-dropdown-prompt
                               yas-ido-prompt
                               yas-completing-prompt)))

(provide 'init-yasnippet)
