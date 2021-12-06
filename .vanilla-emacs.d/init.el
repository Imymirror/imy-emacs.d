;;  -*- lexical-binding: t; -*-

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))


(require 'init-some-path)
(require 'init-imi-func)
(require 'init-basic)
(require 'init-platform)
(require 'init-package)
(require 'init-custom)
(require 'init-roam)
(require 'init-org-mode)
(require 'init-telega)
(require 'init-selectrum)
(require 'init-ryo-modal)

(rg-enable-default-bindings)
(add-hook 'after-init-hook 'global-company-mode)

(require 'winum)
(winum-mode)
(delete-selection-mode)
(doom-modeline-mode)
(org-bullets-mode)
