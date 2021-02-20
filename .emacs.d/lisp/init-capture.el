
(add-to-list 'org-capture-templates
             '("i" "Inbox" entry (file "~/pkm-roam/inbox.org")
             "* %U %^{heading} %^g\n %?\n"))

(provide 'init-capture)
