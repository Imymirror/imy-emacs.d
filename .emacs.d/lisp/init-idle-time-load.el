;; init-idle-time-load.el -*- lexical-binding: t; -*-

(setq  setup-idle-time-once
    (run-with-idle-timer 3 t
                        (lambda ()
			;; (set-face-background 'hl-line "dark slate blue")
			(global-visual-line-mode)
			(winner-mode)
			(ivy-rich-mode)
			(gcmh-mode 1)
			(server-mode)
			(ace-pinyin-global-mode +1)

			(require 'init-capture)
			(require 'init-snippet)
			(require 'init-paredit)
			(require 'init-org-download)

			(require 'init-telega)
			(require 'init-temp)
			(require 'init-which-key)
			(require 'init-pinyin)

                        (cancel-timer setup-idle-time-once)
                            )))

(setq  auto-save-buffer-idle-time
    (run-with-idle-timer 30 t
                        (lambda ()
             ;;(message "auto save all buffer.")
			  (evil-write-all nil)
			  )))

(provide 'init-idle-time-load)
