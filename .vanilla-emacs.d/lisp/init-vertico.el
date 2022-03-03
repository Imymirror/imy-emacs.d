;;  -*- lexical-binding: t; -*-

(use-package vertico
  :straight ( vertico :files (:defaults "extensions/*")
              :includes (vertico-buffer
                         vertico-directory
                         vertico-flat
                         vertico-indexed
                         vertico-mouse
                         vertico-quick
                         vertico-repeat
                         vertico-reverse))
  :init (vertico-mode))


(use-package orderless
  :straight t
  :config
  ;; from purcell
  (defun sanityinc/use-orderless-in-minibuffer ()
    (setq-local completion-styles '(substring orderless)))
  (add-hook 'minibuffer-setup-hook 'sanityinc/use-orderless-in-minibuffer)
  
  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-ignore-case t))

;; (vertico-mode)

;; (require 'vertico-buffer)

;; (setq completion-styles '(orderless)
;;       completion-category-defaults nil
;;       completion-category-overrides '((file (styles partial-completion))))


(provide 'init-vertico)
