;; init-fold.el -*- lexical-binding: t; -*-

;; Clean code folding via Outline minor mode.
(add-hook 'prog-mode-hook 'outline-minor-mode)
(add-hook 'text-mode-hook 'outline-minor-mode)

;; Show all headings but no content in Outline mode.
(add-hook 'outline-minor-mode-hook
	  (defun baba/outline-overview ()
	    "Show only outline headings."
	    (outline-show-all)
	    (outline-hide-body)))


(provide 'init-fold)
