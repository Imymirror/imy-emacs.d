;;  -*- lexical-binding: t; -*-

(use-package racket-mode :straight t
  :bind (:map racket-mode-map
	      ("C-c r r" . racket-run)
	      ))


(provide 'init-racket)
