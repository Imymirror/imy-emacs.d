;;  -*- lexical-binding: t; -*-

(defun imi-load-after-idle-time ()
  (yas-global-mode 1)
  ;;(winum-mode)
  (winner-mode)
  (delete-selection-mode)
  ;;(doom-modeline-mode)
  (global-company-mode)
  (recentf-mode) ;; consult consult-recent-file
  (which-key-mode)
  (ace-pinyin-global-mode))

;; daemon 不允许 idle time，会死机
 (imi-load-after-idle-time)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq  setup-idle-time-once					  	     ;;
;;        (run-with-idle-timer 3 t				  	     ;;
;; 	       (lambda ()					  	     ;;
;; 		 (message "imi-load-after-idle-time")		  	     ;;
;; 		 (imi-load-after-idle-time)			  	     ;;
;; 		 (cancel-timer setup-idle-time-once))))		  	     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'init-mode-enable)
