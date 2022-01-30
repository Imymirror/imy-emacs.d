;;  -*- lexical-binding: t; -*-

(require 'citar-org)

 ;; use consult-completing-read for enhanced interface
;; (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

(defconst robo/bib-libraries (list "~/central-management-system/zotero/asset/My Library.bib"  )) ; All of my bib databases.
;;(defconst robo/main-bib-library (nth 0 robo/bib-libraries))         ; The main db is always the first
(defconst robo/main-pdfs-library-paths `("~/central-management-system/zotero/export/My Library/files" "~/central-management-system/zotero/roam")) ; PDFs directories in a list
;;(defconst robo/main-pdfs-library-path (nth 0 robo/main-pdfs-library-paths)) ; Main PDFs directory

(setq citar-bibliography robo/bib-libraries
        citar-library-paths robo/main-pdfs-library-paths
        ;; citar-file-extensions '("pdf" "org" "md")
	)
(setq citar-file-open-function 'org-open-file)


(setq org-cite-global-bibliography robo/bib-libraries)
(setq org-cite-insert-processor 'citar)
(setq org-cite-follow-processor 'citar)
(setq org-cite-activate-processor 'citar)

(define-key org-mode-map (kbd "C-c c c") 'org-cite-insert)
(define-key org-mode-map (kbd "C-c c o") 'citar-open)
(define-key org-mode-map (kbd "C-c c r") 'citar-refresh)

(setq citar-templates
      '((main . "${author editor:12} ${date year issued:4}  ${title:250}")
          (suffix . "  ${tags keywords keywords:20}")
 ;;       (suffix . "  ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
        (note . "Notes on ${author editor}, ${title}")))

 ;; (setq citar-templates
 ;;        '((main . "${author editor:55}     ${date year issued:4}     ${title:55}")
 ;;          (suffix . "  ${tags keywords keywords:40}")
 ;;          (preview . "${author editor} ${title}, ${journal publisher container-title collection-title booktitle} ${volume} (${year issued date}).\n")
 ;;          (note . "#+title: Notes on ${author editor}, ${title}")))



(provide 'init-citar)
