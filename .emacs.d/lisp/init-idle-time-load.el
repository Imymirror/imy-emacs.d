;; init-idle-time-load.el -*- lexical-binding: t; -*-

(setq  setup-idle-time-once
    (run-with-idle-timer 3 t
                        (lambda ()
			(global-visual-line-mode)
                        (server-mode)
			(ivy-rich-mode)
			(gcmh-mode 1)
			(require 'init-capture)
			(require 'init-snippet)
			(require 'init-paredit)
			(require 'init-org-download)

			(require 'init-telega)
			(require 'init-temp)
			(require 'init-which-key)

                        (cancel-timer setup-idle-time-once)
                            )))

(provide 'init-idle-time-load)
