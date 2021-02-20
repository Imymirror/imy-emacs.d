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

(provide 'init-ivy)

