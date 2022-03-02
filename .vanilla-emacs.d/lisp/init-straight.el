;;  -*- lexical-binding: t; -*-

;; bootstrap straight
(setq straight-base-dir "~/env/emacs/vanilla/straight")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" straight-base-dir))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))



(setq package-list '(
 meow
		      
 ;;yasnippet
 ;;link-hint 

 ;;org-download
;; magit  ace-pinyin rainbow-identifiers
ox-hugo 
	     
citar
;;citeproc
		     
		     tree-sitter tree-sitter-langs
		     
		     ;; selectrum selectrum-prescient ctrlf
		     ;; vertico
		     orderless
		     consult
		     embark
		     embark-consult

		     
		     use-package
		     ))

(dolist (package package-list)
  (straight-use-package package))

(straight-use-package '( vertico :files (:defaults "extensions/*")
                         :includes (vertico-buffer
                                    vertico-directory
                                    vertico-flat
                                    vertico-indexed
                                    vertico-mouse
                                    vertico-quick
                                    vertico-repeat
                                    vertico-reverse)))

(provide 'init-straight)
