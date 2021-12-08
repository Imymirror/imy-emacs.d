;;  -*- lexical-binding: t; -*-

(setq sensitive-path "~/private/sensitive.el")
(when (file-exists-p "~/private/") (load sensitive-path))

;; proxy
(setq url-proxy-services
      `(
        ("http" . ,imy/proxy-url)
        ("https" . ,imy/proxy-url)
        ))

(setq imi-persp-path "~/project/vanilla-emacs/persp-confs/01-imi-persp-auto-save.persp")

(provide 'init-some-path)
