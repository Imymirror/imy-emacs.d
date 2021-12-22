;;  -*- lexical-binding: t; -*-

(setq bibtex-completion-bibliography '("~/project/zotero/export/MyLibrary.bib"
					 ;; "~/Dropbox/emacs/bibliography/dei.bib"
					 ;; "~/Dropbox/emacs/bibliography/master.bib"
				       ;;"~/Dropbox/emacs/bibliography/archive.bib"
				       )
	bibtex-completion-library-path '("~/project/zotero/pdfs/")
	bibtex-completion-notes-path "~/pkm-roam/org-ref/"
	bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

	bibtex-completion-additional-search-fields '(keywords)
	bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
	bibtex-completion-pdf-open-function
	(lambda (fpath)
	  (call-process "open" nil 0 nil fpath)))

(require 'org-ref)
(require 'org-ref-ivy)

 (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
       org-ref-insert-cite-function 'org-ref-cite-insert-ivy
       org-ref-insert-label-function 'org-ref-insert-label-link
       org-ref-insert-ref-function 'org-ref-insert-ref-link
       org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))

(define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)

(provide 'init-org-ref)
