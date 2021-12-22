;;  -*- lexical-binding: t; -*-

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(setq ivy-use-selectable-prompt t)

;; M-x ^
(setq ivy-initial-inputs-alist nil)


(meow-leader-define-key
   '(  "s s" . swiper-isearch)
   '(  "s S" . swiper-all)
   '(  "s i" . counsel-imenu)
   '(  "s r" . counsel-recentf)
   '(  "s d" . counsel-rg)
 )




;; 使用rg 替代 grep, 使用counsel-grep-or-swiper的时候
(setq counsel-grep-base-command
 "rg -i -M 120 --no-heading --line-number --color never '%s' %s")

 ;; ivy
(setq ivy-re-builders-alist
 '((counsel-rg . ivy--regex-plus)
  (swiper . ivy--regex-plus)
  (swiper-isearch . ivy--regex-plus)
  (t . ivy--regex-ignore-order))) ;; 忽略单词顺序


(setq counsel-find-file-ignore-regexp
        (concat
         ;; filename begins with #
         "\\(?:\\`[#.]\\)"
         ;; filename ends with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"
         "\\|\\.elc\\'"
         "\\|\\.pyc\\'"
         "\\|\\.meta\\'"
         ))



(provide 'init-ivy)
