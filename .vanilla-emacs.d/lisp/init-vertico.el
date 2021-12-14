;;  -*- lexical-binding: t; -*-

(vertico-mode)
(marginalia-mode)

(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(provide 'init-vertico)
