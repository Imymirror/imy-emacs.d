;; init-journal.el -*- lexical-binding: t; -*-

(require 'org-journal)

(setq org-journal-dir "~/pkm-roam/agenda/journal")
(setq org-journal-date-prefix "#+TITLE: ")
(setq org-journal-time-prefix "* ")
(setq org-journal-date-format "%Y-%m-%d, %A")
(setq org-journal-file-format "%Y-%m-%d.org")

(spc-leader-def 'normal 'override "j j" 'org-journal-new-entry)
(spc-leader-def 'normal 'override "j d" 'org-journal-new-date-entry)

(setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
(add-to-list 'org-agenda-files org-journal-dir)


;; capture
(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (unless (eq org-journal-file-type 'daily)
    (org-narrow-to-subtree))
  (goto-char (point-max)))


;; 关闭 journal 界面
(defun org-journal-save-entry-and-exit()
  "Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior"
  (interactive)
  (save-buffer)
  (kill-buffer-and-window))
(spc-leader-def 'normal 'override "j k" 'org-journal-save-entry-and-exit)

(provide 'init-journal)
