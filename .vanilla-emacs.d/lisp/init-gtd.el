;; -*- lexical-binding: t; -*-
(setq imi/gtd-path "~/central-management-system/zotero/gtd-daily/gtd/")
(setq imi/gtd-inbox-file (concat imi/gtd-path "inbox.org"))
(setq imi/gtd-tickler-file (concat imi/gtd-path "tickler.org"))
(setq imi/gtd-someday-file (concat imi/gtd-path "someday.org"))
(setq imi/gtd-gtd-file (concat imi/gtd-path "gtd.org"))
(setq imi/gtd-reference-file (concat imi/gtd-path "reference.org"))

(defun open-gtd-dir() (interactive) (find-file imi/gtd-gtd-file))
(global-set-key (kbd "<f6>") 'open-gtd-dir)

;; 定义 org-capture 模版
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline imi/gtd-inbox-file  "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline imi/gtd-tickler-file  "Tickler")
                               "* %i%? \n %U")
			      ))


;; 定义触发 capture inbox 的快捷键
(define-key global-map (kbd "C-c j t") (lambda () (interactive) (org-capture nil "t")))
;; 定义触发 capture Tickler 的快捷键
(define-key global-map (kbd "C-c j T") (lambda () (interactive) (org-capture nil "T")))
;; 归档
(define-key global-map (kbd "C-c j a") 'org-archive-subtree-default)

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)
(setq org-refile-targets '((imi/gtd-gtd-file :maxlevel . 3)
                           (imi/gtd-someday-file :level . 1)
                           (imi/gtd-tickler-file :maxlevel . 2)
                           (imi/gtd-reference-file :maxlevel . 1)
			   ))

;; (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-todo-keywords '((sequence "TODO(t!)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))


(setq org-agenda-custom-commands 
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")))))


(provide 'init-gtd)
