;;  -*- lexical-binding: t; -*-
(use-package link-hint
  :straight t
  :ensure t
  :after org
  :bind
  (:map org-mode-map
          ("C-c l" . link-hint-open-link)))

(provide 'init-link-hint)
