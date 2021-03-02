;; init-which-key.el -*- lexical-binding: t; -*-

(setq which-key-show-early-on-C-h t)
(setq which-key-idle-delay 10000)
(setq which-key-idle-secondary-delay 0.05)

(setq which-key-prefix-prefix "+" )

(setq which-key-add-column-padding 2)

(which-key-mode)

;; (set-face-attribute 'which-key-key-face	nil :font "Hack Nerd Font Mono 14")
;; (set-face-attribute 'which-key-separator-face nil :font "Hack Nerd Font Mono 14")
;; (set-face-attribute 'which-key-note-face nil :font "Hack Nerd Font Mono 14")
;; (set-face-attribute 'which-key-special-key-face nil :font "Hack Nerd Font Mono 14")
;; (set-face-attribute 'which-key-group-description-face nil :font "Hack Nerd Font Mono 14")
;; (set-face-attribute 'which-key-command-description-face nil :font "Hack Nerd Font Mono 14")
;; (set-face-attribute 'which-key-local-map-description-face nil :font "Hack Nerd Font Mono 14")

(setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL"))

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
