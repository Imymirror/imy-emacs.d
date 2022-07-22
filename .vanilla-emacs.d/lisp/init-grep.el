;;  -*- lexical-binding: t; -*-

(use-package wgrep :straight t)
 
(when (executable-find "rg")
  (global-set-key (kbd "M-?") 'rg-project))

(provide 'init-grep)
