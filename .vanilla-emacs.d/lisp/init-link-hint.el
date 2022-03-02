;;  -*- lexical-binding: t; -*-

(use-package link-hint
  :straight t
  :ensure t
  :bind
  ("C-c l o" . link-hint-open-link)
  ("C-c l c" . link-hint-copy-link))

(provide 'init-link-hint)
