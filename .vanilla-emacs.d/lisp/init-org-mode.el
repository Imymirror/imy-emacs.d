;; init-org-mode.el -*- lexical-binding: t; -*-

;; from https://zzamboni.org/post/my-emacs-configuration-with-commentary/
;; https://emacs.stackexchange.com/questions/17710/use-package-with-config-to-set-variables
(use-package org
  :straight t
  :mode (("\\.org$" . org-mode))
  :hook
  (toggle-truncate-lines nil)
  :config
    (require 'ox-org)

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
;; (setq org-cycle-include-plain-lists t)

  (setq org-footnote-auto-adjust t)
  (setq org-cycle-include-plain-lists 'integrate))

(provide 'init-org-mode)
