;; init-evil-surround.el -*- lexical-binding: t; -*-

(global-evil-surround-mode 1)

;; 自定义 ~ 的行为, 我在 ~ 前后多加了个空格
(setq-default evil-surround-pairs-alist
              (push '(?~ . (" ~" . "~ ")) evil-surround-pairs-alist))

(provide 'init-evil-surround)
