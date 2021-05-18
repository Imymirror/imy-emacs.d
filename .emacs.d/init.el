;; init.el -*- lexical-binding: t; -*-

(require 'init-package)
(require 'init-imy)
(require 'init-basic)
(require 'init-ivy)
(require 'init-evil)
(require 'init-font)
(require 'init-general) 
(require 'init-map)
(require 'init-roam)
(require 'init-idle-time-load)
(require 'init-custom)

(require 'init-hydra)
(require 'init-awesome-tab)
(require 'init-keymap)
(require 'init-lsp)
(require 'init-session)

;; (setq garbage-collection-messages t)
;; (setq gcmh-verbose t)

(defun imy/open-vscode ()
  (interactive)
  (let ((files (dired-get-marked-files t current-prefix-arg)))
    (dired-do-shell-command "code *" nil files)))

