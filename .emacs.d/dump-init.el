;; dump-init.el -*- lexical-binding: t; -*-

(setq load-path luna-dumped-load-path)

(global-font-lock-mode)
(transient-mark-mode)

(load "server")
(unless (server-running-p) (server-start))


;; 实现window的undo redo, 和 delete-other-windows 搭配使用
;; 不能dump, 出现错误 : unsupported object type in dump: window configuration
(winner-mode)

;; telega 
(set-fontset-font t 'unicode "Symbola" nil 'append)

;; Chinese Font
(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec  :family imy/chinese-font :size imy/chinese-font-size))))
