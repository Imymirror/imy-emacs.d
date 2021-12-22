;;  -*- lexical-binding: t; -*-

(vertico-mode)
(marginalia-mode)

;; from purcell
(defun sanityinc/use-orderless-in-minibuffer ()
  (setq-local completion-styles '(substring orderless)))
(add-hook 'minibuffer-setup-hook 'sanityinc/use-orderless-in-minibuffer)

(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(provide 'init-vertico)
