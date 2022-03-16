;;  -*- lexical-binding: t; -*-
(use-package link-hint
  :straight t
  :defer 1
  :bind
  (:map org-mode-map
        ("M-l" . link-hint-open-link) ;; downcase useless
        ))

(provide 'init-link-hint)
