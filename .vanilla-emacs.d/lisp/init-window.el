;;  -*- lexical-binding: t; -*-

;; window
(defun imi/window-jump-below ()
  "jump below and move cursor"
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun imi/window-jump-right ()
  "jump below and move cursor"
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(global-set-key (kbd "M-o") 'other-window)

(provide 'init-window)
