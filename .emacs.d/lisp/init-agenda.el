;; init-agenda.el -*- lexical-binding: t; -*-

(setq org-agenda-files (list
			"~/pkm-roam/agenda/GTD.org"
			"~/pkm-roam/agenda/inbox.org"
			"~/pkm-roam/agenda/archive.org"
			))


 (setq org-todo-keywords
        '((sequence
           "☞ TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; An ongoing project that cannot be completed in one step
           "⚔ INPROCESS(i)"  ; A task that is in progress
           "⚑ WAITING(w)"  ; Something is holding up this task; or it is paused
           "|"
           "☟ NEXT(n)"
           ;; "✰ Important(i)"
           "✔ DONE(d)"  ; Task successfully completed
           "✘ CANCELED(c@)" ; Task was cancelled, aborted or is no longer applicable
	   ) 
          (sequence
           ;; "✍ NOTE(N)"
           ;; "FIXME(f)"
           "☕ BREAK(b)"
           ;; "❤ Love(l)"
           "REVIEW(r)"
           ))) ; Task was completed


(setq org-habit-graph-column 40) ;; agenda view 的时候宽带设定大一点

;; 如果设定了 org-agenda-files , 会在 org-agenda-files 列表里查找
(setq org-refile-targets
      '(("archive.org" :maxlevel . 1)
	("GTD.org" :maxlevel . 1)
	))

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)


;; Configure custom agenda views
(setq org-agenda-custom-commands
      '(
	;; ("d" "Dashboard"
	;;  ((agenda "" ((org-deadline-warning-days 7)))
	;;   (todo "☟ NEXT"
	;; 	((org-agenda-overriding-header "Next Tasks")))
	;;   ;; (tags-todo "agenda/⚔ INPROCESS" ((org-agenda-overriding-header "Active Projects")))
	;;   ))


	("d" "TODO"
	 ((todo "☞ TODO"
		((org-agenda-overriding-header "TODO Tasks")))))

	("i" "INPROCESS"
	 ((todo "⚔ INPROCESS"
		((org-agenda-overriding-header "Next Tasks")))))
	
	("n" "Next Tasks"
	 ((todo "☟ NEXT"
		((org-agenda-overriding-header "Next Tasks")))))

	))


(setq org-agenda-show-future-repeats 'next)
(setq org-agenda-repeating-timestamp-show-all nil)


(add-hook 'org-agenda-mode-hook (lambda ()
				  ;; (define-key org-agenda-mode-map "k" 'org-agenda-next-item)

(define-key org-agenda-mode-map "j" 'evil-next-line)
(define-key org-agenda-mode-map "k" 'evil-previous-line)

				  ))

(define-key global-map (kbd "C-c d")
  (lambda () (interactive) (org-agenda nil "d")))

(define-key global-map (kbd "C-c p")
  (lambda () (interactive) (org-agenda nil "i")))

(define-key global-map (kbd "C-c n")
  (lambda () (interactive) (org-agenda nil "n")))

(provide 'init-agenda)
