;; init-which-key.el -*- lexical-binding: t; -*-

(which-key-mode)

(setq which-key-idle-delay 1.0)
(setq which-key-prefix-prefix "+" )

(which-key-add-key-based-replacements
  "SPC b" "buffer"
  "SPC c" "close or hide"
  "SPC m" "bookmark"
  "SPC o" "open"
  "SPC s" "search"
  "SPC t" "toggle"
  "SPC w" "window"
  "SPC f" "frame"
  "SPC h" "help"
)

(provide 'init-which-key)
