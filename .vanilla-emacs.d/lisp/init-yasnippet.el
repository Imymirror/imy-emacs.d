;;  -*- lexical-binding: t; -*-

;; from https://gist.github.com/seanhagen/8421498ea363a2143afd5e73006266b0#file-yasnippet-config-el-L6
(use-package yasnippet
  :straight t
  :bind (:map yas-minor-mode-map
              ("C-c t y" . yas-expand)
	      ("C-c t Y" . yas/visit-snippet-file))
  :init
  (yas-global-mode 1)
  :diminish yas-minor-mode
  :config
  (yas-reload-all)
  
  ;; (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;; (add-hook 'text-mode-hook 'yas-minor-mode)
  ;;(yas-global-mode 1)
  (setq yas-prompt-functions '(yas-dropdown-prompt
                               ;; yas-ido-prompt
                               yas-completing-prompt)))


(provide 'init-yasnippet)

