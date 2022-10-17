;;  -*- lexical-binding: t; -*-

(defun imi/bookmark-set (c) (bookmark-set c))
(defun imi/bookmark-jump (c) (bookmark-jump c))

(use-package emacs
  :bind (
	 ("M-s-s" . crux-visit-term-buffer)
	 ;; unset delete-frame
	 ("s-w" . nil)
	 ("C-c t l" . imi/revert-buffer-no-confirm)
	 ("C-x C-c" . imi/ask-before-closing)
	 ;; :map telega-chat-mode-map
	 ;; ("C-c d" . km-telega-chat-delete)
	 )
  :config
  (put 'narrow-to-region 'disabled nil)
  (electric-pair-mode 1))

(provide 'init-emacs)
