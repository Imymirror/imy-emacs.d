;; init-idle-time-load.el -*- lexical-binding: t; -*-

(defun imy/load-after-idle-time () 


  (load "server")
  (unless (server-running-p) (server-start))

  ;; (ace-pinyin-global-mode +1)
  ;; (mac-auto-operator-composition-mode)

  (require 'unicode-fonts)
  (unicode-fonts-setup)

  (require 'expand-region)
  (global-set-key (kbd "C-=") 'er/expand-region)
  (require 'init-evil-surround)
  (require 'init-agenda)
  (require 'init-journal)			      
  (require 'init-capture)
  (require 'init-snippet)
  (require 'init-paredit)
  (require 'init-org-download)
  (require 'init-company)

  (require 'init-telega)
  (require 'init-temp)
  (require 'init-which-key)
  (require 'init-org-mode)
  (require 'init-random-theme)
  (require 'init-fold)
  ;; (require 'init-pinyin)

  (require 'init-treemacs)
  (require 'init-elfeed)
  (require 'init-nyan-mode)

  (require 'init-enable-mode)
  
			)

;; (imy/load-after-idle-time)

(setq  setup-idle-time-once
	   (run-with-idle-timer 3 t
				(lambda ()
				  (imy/load-after-idle-time)
				  (cancel-timer setup-idle-time-once)
				  )))


;; (setq  auto-save-buffer-idle-time
;;        (run-with-idle-timer 30 t
;; 			    (lambda ()
;; 			      ;;(message "auto save all buffer.")
;; 			      (evil-write-all nil)
;; 			      )))

(provide 'init-idle-time-load)
