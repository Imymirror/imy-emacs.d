;; init-elfeed.el -*- lexical-binding: t; -*-


(require 'elfeed-org)
(elfeed-org)

(setq rmh-elfeed-org-files (list "~/pkm-roam/roam0/elfeed.org"))

(setq-default elfeed-search-filter "@1-months-ago +unread")

(add-hook 'elfeed-search-mode-hook 'elfeed-update)

(setq elfeed-curl-extra-arguments '("-xhttp://localhost:1087"))

(provide 'init-elfeed)
