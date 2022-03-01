;;  -*- lexical-binding: t; -*-

(vertico-mode)

(require 'vertico-buffer)

;; from purcell
(defun sanityinc/use-orderless-in-minibuffer ()
  (setq-local completion-styles '(substring orderless)))
(add-hook 'minibuffer-setup-hook 'sanityinc/use-orderless-in-minibuffer)

;; (setq completion-styles '(orderless)
;;       completion-category-defaults nil
;;       completion-category-overrides '((file (styles partial-completion))))

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

(provide 'init-vertico)
