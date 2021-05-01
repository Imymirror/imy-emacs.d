;; dump-ng.el -*- lexical-binding: t; -*-

(load (expand-file-name "early-init.el" user-emacs-directory))
(load (expand-file-name "dump-entry.el" user-emacs-directory))

(setq evil-want-keybinding nil) 

(require 'package)
(setq package-user-dir imy/package-install-dir)
(setq package-enable-at-startup nil)

;; load autoload files and populate load-path’s
(package-initialize)

(dolist (package package-list)
  (require package))

(setq luna-dumped-load-path load-path)

;; dump image
;; (dump-emacs-portable "~/.emacs.d/emacs.pdmp")
(dump-emacs-portable (expand-file-name "emacs-ng.pdmp" user-emacs-directory))
