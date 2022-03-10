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
  :init (vertico-mode)
  )




;; (vertico-mode)

;; (require 'vertico-buffer)

;; (setq completion-styles '(orderless)
;;       completion-category-defaults nil
;;       completion-category-overrides '((file (styles partial-completion))))


(provide 'init-vertico)
