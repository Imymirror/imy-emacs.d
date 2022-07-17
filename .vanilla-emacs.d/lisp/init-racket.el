;;  -*- lexical-binding: t; -*-

(use-package racket-mode :straight t
  :bind (:map racket-mode-map
	      ("C-c r r" . racket-run)
	      )
  :config
  (setq racket-program "/Applications/Racket v8.4/bin/racket"))

(provide 'init-racket)
