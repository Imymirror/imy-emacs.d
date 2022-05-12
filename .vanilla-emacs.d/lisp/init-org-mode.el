;; init-org-mode.el -*- lexical-binding: t; -*-

;; This package provides visual alignment for Org Mode, Markdown and table.el tables on GUI Emacs. 
  (use-package valign
    :straight
    (:host github :repo "casouri/valign" :branch "master" :files ("*.el" "out"))
    :after org
    :config
    (add-hook 'org-mode-hook #'valign-mode))


;; from https://zzamboni.org/post/my-emacs-configuration-with-commentary/
;; https://emacs.stackexchange.com/questions/17710/use-package-with-config-to-set-variables
(use-package org
  :straight t
;;  :after org-superstar
  :defer t
  ;; :mode (("\\.org$" . org-mode))
  :hook ( winner-mode delete-selection-mode)
  :config
  
;; export code block color 
(setq org-latex-listings t)

  
(setq org-tag-alist '(("review" . ?r)
                      ("summary" . ?s)
                      ("case" . ?c)
                      ("book" . ?b)
                      ("economics" . ?b)
                      ("twitter" . ?t)
                      ("youtube" . ?y)
                      ("emacs" . ?e)
                      ("weibo" . ?w)
                      ("how_to" . ?h)))


  (require 'ox-org)
  (setq org-startup-folded t)

  (setq org-latex-create-formula-image-program 'dvisvgm)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.6))
  (setq org-preview-latex-image-directory (expand-file-name "~/env/emacs/cache/"))
  
  (setq toggle-truncate-lines nil)
  (add-to-list 'org-latex-classes
	       '("org-plain-latex"
		 "\\documentclass{article}[102pt,letterpaper]
    \\tolerance=1000
    [NO-DEFAULT-PACKAGES]
    [EXTRA]"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)
			     ;; (toggle-truncate-lines nil)
			     ))

  ;; (setq org-cycle-include-plain-lists t)
  (recentf-mode 1)

  (setq org-footnote-auto-adjust t)
  (setq org-cycle-include-plain-lists 'integrate))




(provide 'init-org-mode)
