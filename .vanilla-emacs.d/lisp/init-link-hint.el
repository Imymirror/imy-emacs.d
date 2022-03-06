;;  -*- lexical-binding: t; -*-
(use-package link-hint
  :straight t
  :ensure t
  :bind
  (:map org-mode-map
        ("M-l" . link-hint-open-link) ;; downcase useless
        ))

(provide 'init-link-hint)
