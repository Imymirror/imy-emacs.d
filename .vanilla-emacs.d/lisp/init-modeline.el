;;  -*- lexical-binding: t; -*-

(use-package doom-modeline :straight t :init (doom-modeline-mode 1) :config (setq doom-modeline-buffer-file-name-style 'relative-from-project))

;; (use-package diminish :straight t
;;   :config
;;   ;; (defun imi/modeline-face()
;;   ;;   (set-face-attribute 'mode-line nil :font "SongTi SC-20" :weight 'regular )  )

;;   ;; (add-hook 'after-init-hook 'imi/modeline-face)

;;   (diminish 'visual-line-mode)
;;   (diminish 'subword-mode)
;;   (diminish 'auto-revert-mode)
;;   (diminish 'eldoc-mode))

(provide 'init-modeline)
