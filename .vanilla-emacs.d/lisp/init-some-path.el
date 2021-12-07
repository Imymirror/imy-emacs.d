;;  -*- lexical-binding: t; -*-


(setq sensitive-path "~/private/sensitive.el")
(when (file-exists-p "~/private/") (load sensitive-path))

(provide 'init-some-path)
