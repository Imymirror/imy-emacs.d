;;  -*- lexical-binding: t; -*-

(use-package citar
  :straight t
  :bind (	      ("C-c c o" . citar-open)
		      ;; :map org-mode-map
		      ("C-c c c" . org-cite-insert)
		      ("C-c c r" . citar-insert-reference)
		      ("C-c c R" . citar-refresh))
  :config

  (require 'citar-org)

  (defconst robo/bib-libraries (list "~/central-management-system/0-shape-up-method/zotero/asset/My Library.bib"    )) ; All of my bib databases.
  ;;(defconst robo/main-bib-library (nth 0 robo/bib-libraries))         ; The main db is always the first
;  (defconst robo/main-pdfs-library-paths `("~/central-management-system/zotero/data/storage" )) ; PDFs directories in a list
  ;;(defconst robo/main-pdfs-library-path (nth 0 robo/main-pdfs-library-paths)) ; Main PDFs directory

   (setq citar-bibliography robo/bib-libraries
 ;       citar-library-paths robo/main-pdfs-library-paths
        ;; citar-file-extensions '("pdf" "org" "md")
	 )
  (setq citar-file-open-function 'org-open-file)

  (setq org-cite-global-bibliography robo/bib-libraries)
  (setq org-cite-insert-processor 'citar)
  (setq org-cite-follow-processor 'citar)
  (setq org-cite-activate-processor 'citar))

(provide 'init-citar)
