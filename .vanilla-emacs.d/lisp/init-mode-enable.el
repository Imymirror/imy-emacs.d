;;  -*- lexical-binding: t; -*-

(defun imi/load-after-idle-time ()
  ;;  (hs-minor-mode)
  ;; (yas-global-mode 1)
 ;; (smartparens-global-mode)
  ;;(winum-mode)
  (winner-mode)
  (delete-selection-mode)
;;  (yas-global-mode +1)
  ;; (add-hook 'after-init-hook 'global-company-mode)
  ;; (add-hook 'after-init-hook 'yas-global-mode)
  
  (recentf-mode) ;; consult consult-recent-file
  ;; (which-key-mode)
  )

;; daemon 不允许 idle time，会死机
(imi/load-after-idle-time)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq  setup-idle-time-once					  	     ;;
;;        (run-with-idle-timer 3 t				  	     ;;
;; 	       (lambda ()					  	     ;;
;; 		 (message "imi/load-after-idle-time")		  	     ;;
;; 		 (imi/load-after-idle-time)			  	     ;;
;; 		 (cancel-timer setup-idle-time-once))))		  	     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-mode-enable)
