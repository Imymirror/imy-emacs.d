;;  -*- lexical-binding: t; -*-

(use-package unfill :straight t )
(use-package list-unicode-display :straight t )

;; (use-package beacon :straight t 
;;   :init
;;   (beacon-mode 1)
;;   :config 
;;   (setq-default beacon-lighter "")
;;   (setq-default beacon-size 20)
;;   (setq beacon-color "#765"))

;; (when (fboundp 'electric-pair-mode)
;;   (add-hook 'after-init-hook 'electric-pair-mode))
;; (add-hook 'after-init-hook 'electric-indent-mode)

(add-hook 'after-init-hook 'delete-selection-mode)


;;; Some basic preferences

(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (locate-user-emacs-file ".bookmarks.el")
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 create-lockfiles nil
 auto-save-default nil
                                        ; make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

                                        ;(add-hook 'after-init-hook 'transient-mark-mode)

(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)

(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))


;; (when (boundp 'display-fill-column-indicator)
;;   (setq-default indicate-buffer-boundaries 'left)
;;   (setq-default display-fill-column-indicator-character ?\u254e)
;;   (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))


(use-package rainbow-delimiters :straight t 
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package symbol-overlay :straight t :disabled nil
  :config 


  (dolist (hook '(prog-mode-hook html-mode-hook yaml-mode-hook conf-mode-hook))
    (add-hook hook 'symbol-overlay-mode))

  (define-key symbol-overlay-mode-map (kbd "M-i") 'symbol-overlay-put)
  (define-key symbol-overlay-mode-map (kbd "M-I") 'symbol-overlay-remove-all)
  (define-key symbol-overlay-mode-map (kbd "M-n") 'symbol-overlay-jump-next)
  (define-key symbol-overlay-mode-map (kbd "M-p") 'symbol-overlay-jump-prev)
  )


(use-package browse-kill-ring :straight t 
  :bind 
  (("M-Y" . browse-kill-ring))
  :config
  (setq browse-kill-ring-separator "\f")
  (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
  (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
  (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous)
  )

(use-package page-break-lines :straight t 
  :config 
  (add-hook 'after-init-hook 'global-page-break-lines-mode)
  (add-to-list 'page-break-lines-modes 'browse-kill-ring-mode))


(add-hook 'after-init-hook 'show-paren-mode)

;;; Handy key bindings
;; (global-set-key (kbd "C-.") 'set-mark-command)
;; (global-set-key (kbd "C-x C-.") 'pop-global-mark)

(global-set-key (kbd "C-;") 'ace-pinyin-jump-char)


(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))


(use-package move-dup :straight t 
  :bind (([M-S-down] . move-dup-duplicate-down)
         ([M-S-up] . move-dup-duplicate-up)
         ([M-down] . move-dup-move-lines-down)
         ([M-up] . move-dup-move-lines-up)
         ))


(defun sanityinc/backward-up-sexp (arg)
  "Jump up to the start of the ARG'th enclosing sexp."
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (sanityinc/backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'sanityinc/backward-up-sexp) ; C-M-u, C-M-up

(defun sanityinc/open-line-with-reindent (n)
  "A version of `open-line' which reindents the start and end positions.
If there is a fill prefix and/or a `left-margin', insert them
on the new line if the line would have been blank.
With arg N, insert N newlines."
  (interactive "*p")
  (let* ((do-fill-prefix (and fill-prefix (bolp)))
         (do-left-margin (and (bolp) (> (current-left-margin) 0)))
         (loc (point-marker))
         ;; Don't expand an abbrev before point.
         (abbrev-mode nil))
    (delete-horizontal-space t)
    (newline n)
    (indent-according-to-mode)
    (when (eolp)
      (delete-horizontal-space t))
    (goto-char loc)
    (while (> n 0)
      (cond ((bolp)
             (if do-left-margin (indent-to (current-left-margin)))
             (if do-fill-prefix (insert-and-inherit fill-prefix))))
      (forward-line 1)
      (setq n (1- n)))
    (goto-char loc)
    (end-of-line)
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'sanityinc/open-line-with-reindent)

(global-set-key (kbd "M-j") 'join-line)


;; Random line sorting
(defun sanityinc/sort-lines-random (beg end)
  "Sort lines in region from BEG to END randomly."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))

(defun sanityinc/disable-features-during-macro-call (orig &rest args)
  "When running a macro, disable features that might be expensive.
ORIG is the advised function, which is called with its ARGS."
  (let (post-command-hook
        font-lock-mode
        (tab-always-indent (or (eq 'complete tab-always-indent) tab-always-indent)))
    (apply orig args)))

(advice-add 'kmacro-call-macro :around 'sanityinc/disable-features-during-macro-call)

(provide 'init-editing-utils)
