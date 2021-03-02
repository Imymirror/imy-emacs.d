;; init-basic.el -*- lexical-binding: t; -*-

;;(add-to-list 'custom-theme-load-path "~/.emacs.d.imymirror/package-manual/emacs-color-theme-solarized")
;; themes i like : doom-dracula dichromacy  doom-ayu-light, dichromacy
(load-theme 'doom-dracula t)

;; 备份文件
(setq
     backup-by-copying t ; 自动备份
   ;;   backup-directory-alist
   ;;   '(("." . backup-directory)) ; 自动备份在目录"~/.em_backup"下
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 3 ; 保留最近的3个备份文件
     kept-old-versions 1 ; 保留最早的1个备份文件
     version-control t) ; 多次备份

(if (not (file-exists-p imy/backup-dir))
    (make-directory imy/backup-dir t))

(setq backup-directory-alist
      `(("." . ,imy/backup-dir)))

;; font
;; Setting English Font 
(set-face-attribute 'default nil :height 150 :weight 'bold :family "menlo")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "PingFang SC" :size 15)))

;; (set-face-background 'hl-line "midnight blue")
;; (set-face-background hl-line-face "gray13")

;; (global-linum-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(delete-selection-mode 1)
(global-hl-line-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(toggle-truncate-lines nil)
(display-time-mode 1)
(setq ring-bell-function 'ignore)

(setq display-time-24hr-format t)
;; (setq display-time-day-and-date t)

(setq inhibit-startup-message t)
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
;; (setq default-frame-alist (quote ((fullscreen . maximized))))

(setq initial-frame-alist '(
			    (top . 0) (left . 0) (width . 160) (height . 40)
			    (tool-bar-lines . 0) 
			    (vertical-scroll-bars . nil)
			    (horizontal-scroll-bars . nil)
			    (internal-border-width . 10)
			    ))

(setq default-frame-alist '(
			    (top . 0) (left . 0) (width . 160) (height . 40)
                            (tool-bar-lines . 0) 
			    (vertical-scroll-bars . nil)
			    (horizontal-scroll-bars . nil)
			    (internal-border-width . 10)
			    )
      )



(setq org-link-frame-setup '((file . find-file))) ;; 同一个窗口下打开org文件, 默认是在另一个窗口打

(defun yes-or-no-p->-y-or-n-p (orig-fun &rest r)
  (cl-letf (((symbol-function 'yes-or-no-p) #'y-or-n-p))
    (apply orig-fun r)))

(advice-add 'kill-buffer :around #'yes-or-no-p->-y-or-n-p)

(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-return-follows-link t)

(setq writeroom-width 100)

(setq org-preview-latex-image-directory "~/.my-emacs-env/ltximg/")

;; early-init Compatibility with Emacs 26
(cond ((version< emacs-version "26.1")
       (warn "M-EMACS requires Emacs 26.1 and above!"))
      ((let* ((early-init-f (expand-file-name "early-init.el" user-emacs-directory))
              (early-init-do-not-edit-d (expand-file-name "early-init-do-not-edit/" user-emacs-directory))
              (early-init-do-not-edit-f (expand-file-name "early-init.el" early-init-do-not-edit-d)))
         (and (version< emacs-version "27")
              (or (not (file-exists-p early-init-do-not-edit-f))
                  (file-newer-than-file-p early-init-f early-init-do-not-edit-f)))
         (make-directory early-init-do-not-edit-d t)
         (copy-file early-init-f early-init-do-not-edit-f t t t t)
         (add-to-list 'load-path early-init-do-not-edit-d)
         (require 'early-init))))

(provide 'init-basic)

