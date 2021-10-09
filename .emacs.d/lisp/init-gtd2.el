;; init-gtd2.el -*- lexical-binding: t; -*-
(setq imy/gtd-dir "~/pkm-roam/roam2/gtd/")
(setq imy/gtd-inbox-file (concat imy/gtd-dir "inbox.org"))
(setq imy/gtd-tickler-file (concat imy/gtd-dir "tickler.org"))
(setq imy/gtd-someday-file (concat imy/gtd-dir "someday.org"))
(setq imy/gtd-gtd-file (concat imy/gtd-dir "gtd.org"))

(defun open-gtd-dir() (interactive) (find-file imy/gtd-dir))
(global-set-key (kbd "<f6>") 'open-gtd-dir)

;; 定义 org-capture 模版
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline imy/gtd-inbox-file  "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline imy/gtd-tickler-file  "Tickler")
                               "* %i%? \n %U")))


;; 定义触发 capture inbox 的快捷键
(define-key global-map (kbd "C-c c t") (lambda () (interactive) (org-capture nil "t")))
;; 定义触发 capture Tickler 的快捷键
(define-key global-map (kbd "C-c c T") (lambda () (interactive) (org-capture nil "T")))

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)
(setq org-refile-targets '((imy/gtd-gtd-file :maxlevel . 3)
                           (imy/gtd-someday-file :level . 1)
                           (imy/gtd-tickler-file :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-agenda-files (list imy/gtd-inbox-file imy/gtd-gtd-file imy/gtd-tickler-file))


(setq org-agenda-custom-commands 
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")))))


(provide 'init-gtd2)
