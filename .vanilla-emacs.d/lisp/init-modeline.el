;;  -*- lexical-binding: t; -*-

;; (use-package doom-modeline :straight t :init (doom-modeline-mode 1) :config (setq doom-modeline-buffer-file-name-style 'relative-from-project))

(use-package diminish :straight t
  :config

  ;; (defun imi/modeline-face()
  ;;   (set-face-attribute 'mode-line nil :font "SongTi SC-20" :weight 'regular )  )

  ;; (add-hook 'after-init-hook 'imi/modeline-face)
  
  (diminish 'projectile-mode)
  (diminish 'org-indent-mode)
  (diminish 'auto-revert-mode)

  (diminish 'company-mode)
  (diminish 'ace-pinyin-mode)
  (diminish 'meow-insert-mode '(:propertize " [I]" face '(:foreground "tan")))
  (diminish 'meow-normal-mode '(:propertize " [N]" face '(:foreground "plum")))
  (diminish 'smartparens-mode)
  (diminish 'eldoc-mode))



(provide 'init-modeline)
