;; init-ivy.el -*- lexical-binding: t; -*-

(ivy-mode 1)
;;(setq ivy-use-virtual-buffers t) ;; 是否要将 bookmark 和 recentf 加入 ivy-swich-buffer.
(setq enable-recursive-minibuffers t)

;; delete M-x ^
;;(setq ivy-initial-inputs-alist nil)
(with-eval-after-load 'counsel
  (setq ivy-initial-inputs-alist nil))

(define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)
;;(define-key ivy-minibuffer-map (kbd "<ESC>") 'minibuffer-keyboard-quit)
;;(define-key swiper-map (kbd "<ESC>") 'minibuffer-keyboard-quit)

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


(custom-set-faces
 '(ivy-current-match
   ((((class color) (background light))
     :background "red" :foreground "white")
    (((class color) (background dark))
     :background "blue" :foreground "black"))))

;; 创建文件到时候能向上选择
(setq ivy-use-selectable-prompt t)



(provide 'init-ivy)
