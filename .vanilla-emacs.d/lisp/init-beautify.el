;;  -*- lexical-binding: t; -*-

;; beautify
(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'visual-line-mode) ;; conflict : full-paragraph and proportional font

;; headline font size
(defun imi/org-beautify-headline-font-size ()
  (let* ((variable-tuple
          (cond
	   ;; ((x-list-fonts "PingFang SC")     '(:font "PingFang SC"))
	   ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
           ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
           ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
           ((x-list-fonts "Verdana")         '(:font "Verdana"))
           ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
           (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
	 (base-font-color     (face-foreground 'default nil 'default))
	 (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.3))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.2 :underline nil))))))
  )

;; 打开方式有三种 : emacs -nw, emacs daemon, emacs
;; display-graphic-p window-system 的结果分别为 (nil,nil), (true,true), (true,true)
(if (window-system)
        (add-hook 'after-make-frame-functions
              (lambda (frame)
		(imi/org-beautify-headline-font-size))))


(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 ;; '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))


(with-eval-after-load 'org
  (defvar-local rasmus/org-at-src-begin -1
    "Variable that holds whether last position was a ")

  (defvar rasmus/ob-header-symbol ?☰
    "Symbol used for babel headers")

  (defun rasmus/org-prettify-src--update ()
    (let ((case-fold-search t)
          (re "^[ \t]*#\\+begin_src[ \t]+[^ \f\t\n\r\v]+[ \t]*")
          found)
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (goto-char (match-end 0))
          (let ((args (org-trim
                       (buffer-substring-no-properties (point)
                                                       (line-end-position)))))
            (when (org-string-nw-p args)
              (let ((new-cell (cons args rasmus/ob-header-symbol)))
                (cl-pushnew new-cell prettify-symbols-alist :test #'equal)
                (cl-pushnew new-cell found :test #'equal)))))
        (setq prettify-symbols-alist
              (cl-set-difference prettify-symbols-alist
                                 (cl-set-difference
                                  (cl-remove-if-not
                                   (lambda (elm)
                                     (eq (cdr elm) rasmus/ob-header-symbol))
                                   prettify-symbols-alist)
                                  found :test #'equal)))
        ;; Clean up old font-lock-keywords.
        (font-lock-remove-keywords nil prettify-symbols--keywords)
        (setq prettify-symbols--keywords (prettify-symbols--make-keywords))
        (font-lock-add-keywords nil prettify-symbols--keywords)
        (while (re-search-forward re nil t)
          (font-lock-flush (line-beginning-position) (line-end-position))))))

  (defun rasmus/org-prettify-src ()
    "Hide src options via `prettify-symbols-mode'.

        `prettify-symbols-mode' is used because it has uncollpasing. It's
        may not be efficient."
    (let* ((case-fold-search t)
           (at-src-block (save-excursion
                           (beginning-of-line)
                           (looking-at "^[ \t]*#\\+begin_src[ \t]+[^ \f\t\n\r\v]+[ \t]*"))))
      ;; Test if we moved out of a block.
      (when (or (and rasmus/org-at-src-begin
                     (not at-src-block))
                ;; File was just opened.
                (eq rasmus/org-at-src-begin -1))
        (rasmus/org-prettify-src--update))
      ;; Remove composition if at line; doesn't work properly.
      ;; (when at-src-block
      ;;   (with-silent-modifications
      ;;     (remove-text-properties (match-end 0)
      ;;                             (1+ (line-end-position))
      ;;                             '(composition))))
      (setq rasmus/org-at-src-begin at-src-block)))

  ;; This function helps to produce a single glyph out of a
  ;; string. The glyph can then be used in prettify-symbols-alist.
  ;; This function was provided by Ihor in the org-mode mailing list.
  (defun yant/str-to-glyph (str)
    "Transform string into glyph, displayed correctly."
    (let ((composition nil))
      (dolist (char (string-to-list str)
                    (nreverse (cdr composition)))
        (push char composition)
        (push '(Br . Bl) composition))))

  (defun rasmus/org-prettify-symbols ()
    (mapc (apply-partially 'add-to-list 'prettify-symbols-alist)
          (cl-reduce 'append
                     (mapcar (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                             `(("#+begin_src" . ?⎡) ;; ⎡ ➤ 🖝 ➟ ➤ ✎
                               ;; multi-character strings can be used with something like this:
                               ;; ("#+begin_src" . ,(yant/str-to-glyph "```"))
                               ("#+end_src"   . ?⎣) ;; ⎣ ✐
                               ("#+header:" . ,rasmus/ob-header-symbol)
                               ("#+begin_quote" . ?«)
                               ("#+end_quote" . ?»)))))
    (turn-on-prettify-symbols-mode)
    (add-hook 'post-command-hook 'rasmus/org-prettify-src t t))
  (add-hook 'org-mode-hook #'rasmus/org-prettify-symbols))


(provide 'init-beautify)
