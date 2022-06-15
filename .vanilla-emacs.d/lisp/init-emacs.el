;;  -*- lexical-binding: t; -*-

(use-package emacs
  :bind (
	 ("M-s-s" . imi/my-term)
	 ;; unset delete-frame
	 ("s-w" . nil)
	 ("C-c t l" . imi/revert-buffer-no-confirm)
	 ("C-x C-c" . imi/ask-before-closing)
	 :map telega-chat-mode-map
	 ("C-c d" . km-telega-chat-delete)
	 )
  )

(provide 'init-emacs)
