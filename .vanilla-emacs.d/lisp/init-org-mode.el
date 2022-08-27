;; init-org-mode.el -*- lexical-binding: t; -*-

 ;; (use-package org-modern :straight t :config)

;; This package provides visual alignment for Org Mode, Markdown and table.el tables on GUI Emacs.
(use-package valign
  :straight
  (:host github :repo "casouri/valign" :branch "master" :files ("*.el" "out"))
  :defer 2)

;; from https://zzamboni.org/post/my-emacs-configuration-with-commentary/
;; https://emacs.stackexchange.com/questions/17710/use-package-with-config-to-set-variables
(use-package org :straight  t
;  :defer t
  :bind (("C-c o l" . imi/copy-org-link ))
  :config
  ;;  headline press C-c C-c
  (setq org-tag-alist '(("review" . ?r)
                        ("summary" . ?s)
                        ("case" . ?c)
                        ("book" . ?b)
                        ("economics" . ?e)
                        ("refile" . ?r)
                        ("twitter" . ?t)
                        ("youtube" . ?y)
                        ("emacs" . ?e)
                        ("weibo" . ?w)
                        ("how" . ?h)))

  (require 'ox-org)

;;  (global-visual-line-mode)

  (setq org-cycle-include-plain-lists t)

  (setq org-footnote-auto-adjust t)
  (setq org-cycle-include-plain-lists 'integrate)

  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook (lambda() (setq truncate-lines nil)))

  (setq org-startup-folded 'showall)
  

  ;; (require 'warnings)
  ;; (setq warning-suppress-types (append warning-suppress-types '((org-element-cache))))
 )



(provide 'init-org-mode)
