;; init-org-mode.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook 'org-indent-mode)
(setq grab-mac-link-dwim-favourite-app 'chrome)

(setq org-footnote-auto-adjust t)

(require 'ox-org)

(provide 'init-org-mode)
