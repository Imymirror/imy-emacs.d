;; init-mode-line.el -*- lexical-binding: t; -*-

(require 'doom-modeline)
(doom-modeline-mode 1)

;; Or use this
;; Use `window-setup-hook' if the right segment is displayed incorrectly
(add-hook 'after-init-hook #'doom-modeline-mode)

(add-to-list 'load-path (concat imy/package-manual-dir "nyan-mode"))
(require 'nyan-mode)
(nyan-mode)

(provide 'init-mode-line)
