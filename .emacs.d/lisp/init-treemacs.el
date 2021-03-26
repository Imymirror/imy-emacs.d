;; init-treemacs.el -*- lexical-binding: t; -*-
(require 'treemacs)
(require 'treemacs-evil)
(require 'treemacs-projectile)

(with-eval-after-load 'winum
  (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))

(treemacs-resize-icons 22)
(treemacs-follow-mode t)
(treemacs-filewatch-mode t)
(treemacs-fringe-indicator-mode 'always)

(pcase (cons (not (null (executable-find "git")))
	     (not (null treemacs-python-executable)))
  (`(t . t)
   (treemacs-git-mode 'deferred))
  (`(t . _)
   (treemacs-git-mode 'simple)))

(setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
      treemacs-deferred-git-apply-delay      0.5
      treemacs-directory-name-transformer    #'identity
      treemacs-display-in-side-window        t
      treemacs-eldoc-display                 t
      treemacs-file-event-delay              5000
      treemacs-file-extension-regex          treemacs-last-period-regex-value
      treemacs-file-follow-delay             0.2
      treemacs-file-name-transformer         #'identity
      treemacs-follow-after-init             t
      treemacs-git-command-pipe              ""
      treemacs-goto-tag-strategy             'refetch-index
      treemacs-indentation                   2
      treemacs-indentation-string            " "
      treemacs-is-never-other-window         nil
      treemacs-max-git-entries               5000
      treemacs-missing-project-action        'ask
      treemacs-move-forward-on-expand        nil
      treemacs-no-png-images                 nil
      treemacs-no-delete-other-windows       t
      treemacs-project-follow-cleanup        nil
      treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
      treemacs-position                      'left
      treemacs-read-string-input             'from-child-frame
      treemacs-recenter-distance             0.1
      treemacs-recenter-after-file-follow    nil
      treemacs-recenter-after-tag-follow     nil
      treemacs-recenter-after-project-jump   'always
      treemacs-recenter-after-project-expand 'on-distance
      treemacs-show-cursor                   nil
      treemacs-show-hidden-files             t
      treemacs-silent-filewatch              nil
      treemacs-silent-refresh                nil
      treemacs-sorting                       'alphabetic-asc
      treemacs-space-between-root-nodes      t
      treemacs-tag-follow-cleanup            t
      treemacs-tag-follow-delay              1.5
      treemacs-user-mode-line-format         nil
      treemacs-user-header-line-format       nil
      treemacs-width                         35
      treemacs-workspace-switch-cleanup      nil)

(provide 'init-treemacs)
