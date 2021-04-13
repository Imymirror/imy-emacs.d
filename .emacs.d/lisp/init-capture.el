;; init-capture.el -*- lexical-binding: t; -*-

;; (setq org-capture-templates '(("j" "Journal entry" plain (function org-journal-find-location)
;;                                "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
;;                                :jump-to-captured t :immediate-finish t)))

(setq org-capture-templates
    `(

      ("t" "Tasks / Projects")
      ("ti" "Task" entry (file+olp "~/pkm-roam/agenda/inbox.org" "Inbox")
       "* %?\n  %U\n  %a\n  %i" :empty-lines 1)
      ("ts" "Task" entry (file+olp "~/pkm-roam/agenda/inbox.org" "resource")
       "* %?\n  %U\n  %a\n  %i" :empty-lines 1)


      
      ;; ("ts" "Clocked Entry Subtask" entry (clock)
      ;;  "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)
      ;; ("h" "Inbox" entry (file "~/pkm-roam/agenda/inbox.org")
      ;;        "* %U %^{heading} %^g\n %?\n")
    
      ;; ("w" "Task" entry (file+olp "~/pkm-roam/agenda/inbox.org" "webpage")
      ;;  "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)
    ))

(define-key global-map (kbd "C-c i")
  (lambda () (interactive) (org-capture nil "ti")))

(define-key global-map (kbd "C-c s")
  (lambda () (interactive) (org-capture nil "ts")))

(provide 'init-capture)
