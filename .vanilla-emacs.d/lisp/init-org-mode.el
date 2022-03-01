;; init-org-mode.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-footnote-auto-adjust t)
(setq org-cycle-include-plain-lists 'integrate)
;; (setq org-cycle-include-plain-lists t)


(require 'ox-org)

;; export
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



(provide 'init-org-mode)
