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


;; install
(straight-use-package 'el-patch)

(setq package-list '(
		     which-key org-roam  rg company smartparens    avy   yasnippet link-hint grab-mac-link org-download  magit meow ace-pinyin ox-hugo rainbow-identifiers 
		     doom-themes
		     treemacs
		     
		     citar ;;citeproc
		     lsp-mode  
		     tree-sitter tree-sitter-langs
		     
		     ;; selectrum selectrum-prescient ctrlf
		     vertico orderless marginalia consult
		     
		     ;; swiper counsel	
		     ;; org-ref ivy-bibtex hydra
		     ;;persp-mode  ryo-modal winum expand-region 
		     ;;crux

		     ;;	      telega	     visual-fill-column
		     ;; doom-modeline
		     ))

(dolist (package package-list)
  (straight-use-package package))

;; (straight-use-package
;;  '(el-patch :type git :host github :repo "zevlg/telega.el" :commit "26fee82fac70d55ade55381b475e865d99dde496"
;; 	    ))


(provide 'init-straight)
