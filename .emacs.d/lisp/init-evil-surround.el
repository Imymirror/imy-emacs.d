;; init-evil-surround.el -*- lexical-binding: t; -*-

(global-evil-surround-mode 1)

(setq-default evil-surround-pairs-alist
              (push '(?~ . (" ~" . "~ ")) evil-surround-pairs-alist))

(provide 'init-evil-surround)
