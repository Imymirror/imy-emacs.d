;; init-org-mode.el -*- lexical-binding: t; -*-

 ;; (use-package org-modern :straight t :config)

(defun imi/org-set-tag()

;; (setq org-tag-persistent-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l) ("test" . ?t) ))
  ;; 根据 note:my/标签 来设置 org-tag-persistent-alist
  (setq org-tag-alist '(("frustrated") ("principle") ("timeline")))
  
  (setq org-tag-persistent-alist '(("orientation" . ?O)
                                   ("Q@A" . ?q)
                                   ("practice" . ?P)
                                   ("pov" . ?p)
                                   ("atom" . ?a)
                                   ("table")
                                   ("technique")
                                   ("define" . ?d)
                                   ("evidence" . ?e)
                                   ("quote" . ?Q)
                                   ("case" . ?c)
                                   ("method" . ?m)
                                   ("opinion" . ?o)
                                   ("decision" . ?D)
                                   ("textology" . ?T)
                                   ("list" . ?l)
                                   ("topic" . ?t)
                                   ("thoery" . ?h)
                                   ("vs" . ?v)
                                   ("review" . ?r)
                                   ("schools" . ?S)
                                   ("wiki" . ?w)
                                   ("chain" . ?C)
                                   ("book" . ?b)
                                   ("series" . ?s)
                                   ("course")
                                   ("seminars")
                                   ("people")
                                   ("principle")
                                   ("outline")
                                   ("5")
                                   ("inspiration" . ?I)
                                   ("insight" . ?i)
                                   ))
  )

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
  
  (imi/org-set-tag)

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
