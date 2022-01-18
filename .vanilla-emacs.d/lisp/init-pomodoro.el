;;  -*- lexical-binding: t; -*-

(setq pomidor-sound-tick nil   pomidor-sound-tack nil)

(global-set-key (kbd "C-c t t") 'pomidor) 
(global-set-key (kbd "C-c t q") 'pomidor-quit) 

;; (setq pomidor-seconds (* 25 60)) ; 25 minutes for the work period
;; (setq pomidor-break-seconds (* 5 60)) ; 5 minutes break time
;; (setq pomidor-breaks-before-long 4) ; wait 4 short breaks before long break
;; (setq pomidor-long-break-seconds (* 20 60)) ; 20 minutes long break time

(setq alert-default-style 'mode-line)

(setq pomidor-play-sound-file
      (lambda (file)
        (start-process "my-pomidor-play-sound"
                       nil
                       "mpv"
		       "--player-operation-mode=pseudo-gui"
                       file)))


(provide 'init-pomodoro)
