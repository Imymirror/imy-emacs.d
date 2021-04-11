;;; early-init.el --- -*- lexical-binding: t -*-


(when (file-exists-p "~/private/") (load "~/private/sensitive.el")) 

;; proxy
(setq url-proxy-services
      `(
        ("http" . ,imy/proxy-url)
        ("https" . ,imy/proxy-url)
        ))

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defvar imy/package-install-dir "~/.my-emacs-env/package-install/" "directory for package install")
(setq imy/backup-dir "~/.my-emacs-env/backup/")
(setq imy/autosave-dir "~/.my-emacs-env/autosave/")
(setq imy/package-manual-dir "~/.my-emacs-env/package-manual/")

(setq imy/lisp-dir (expand-file-name "lisp/" user-emacs-directory))
(add-to-list 'load-path imy/lisp-dir)

(setq package-enable-at-startup nil)

(setq site-run-file nil)

;;(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(require 'init-speedup)

;; 去掉一些提示
(setq load-prefer-newer t)
(setq byte-compile-warnings '(cl-functions))


(provide 'early-init)

