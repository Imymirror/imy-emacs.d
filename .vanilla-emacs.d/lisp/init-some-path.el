;;  -*- lexical-binding: t; -*-

(setq sensitive-path "~/private/sensitive.el")
(when (file-exists-p "~/private/") (load sensitive-path))

(setq imi-persp-path "~/env/emacs/vanilla/persp-confs/01-imi-persp-auto-save.persp")
(setq persp-save-dir (expand-file-name "persp-confs/" "~/env/emacs/vanilla/"))

(setq imi-package-path "~/env/emacs/vanilla/packages")
(setq imi-backup-path  "~/env/emacs/vanilla/backup")

;; proxy
(setq url-proxy-services
      `(
        ("http" . ,imy/proxy-url)
        ("https" . ,imy/proxy-url)
        ))


(provide 'init-some-path)
