;;  -*- lexical-binding: t; -*-

(use-package org-fragtog :straight t
  :config
    ;; export code block color 
  (setq org-latex-listings t)

  (setq org-latex-create-formula-image-program 'dvisvgm)
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.6))
  (setq org-preview-latex-image-directory (expand-file-name "~/env/emacs/cache/"))
  
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

  (add-hook 'org-mode-hook 'org-fragtog-mode))

(provide 'init-latex)
