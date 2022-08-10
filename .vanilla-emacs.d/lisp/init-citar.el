;;  -*- lexical-binding: t; -*-

(use-package citar :straight t
  :no-require
  :custom
  (org-cite-global-bibliography (list (concat imi/second-brain-root-path "assets/My Library.bib")))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  ;; optional: org-cite-insert is also bound to C-c C-x C-@
  :bind (	      ("C-c c o" . citar-open)
		      ;; :map org-mode-map
		      ("C-c c c" . org-cite-insert)
		      ("C-c c C" . citar-insert-reference)
		      ("C-c c r" . citar-refresh))
  :config
  (setq citar-file-open-function 'org-open-file)
  (setq citar-templates
      '((main . "${author editor:10} ${date year issued:4}   ${title:48}")
        (suffix . " ${=key= id:15}  ${=type=:12}  ${tags keywords:*}")
        (preview . "${author editor} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
        (note . "Notes on ${author editor}, ${title}")))

;; (defun my-minibuffer-setup ()
;;        (set (make-local-variable 'face-remapping-alist)
;;             '((default :height 1.0 :family "Sarasa Mono SC Nerd"))))

;; (add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)
)

(provide 'init-citar)
