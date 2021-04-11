;; init-dump.el -*- lexical-binding: t; -*-

(defvar luna-dumped nil
  "non-nil when a dump file is loaded.
(Because dump.el sets this variable).")

(defmacro luna-if-dump (then &rest else)
  "Evaluate IF if running with a dump file, else evaluate ELSE."
  (declare (indent 1))
  `(if luna-dumped
       ,then
     ,@else))

(luna-if-dump
    (progn
      (setq load-path luna-dumped-load-path)

      (global-font-lock-mode)
      (transient-mark-mode)

      (add-hook 'after-init-hook
		(lambda ()
		  (save-excursion
		    (switch-to-buffer "*scratch*")
		    (lisp-interaction-mode))))


      (require 'init-enable-mode)

      (load "server")
      (unless (server-running-p) (server-start))

      (set-fontset-font t 'unicode "Symbola" nil 'append)

      ;; Chinese Font 配制中文字体 PingFang SC | Songti SC
	(if (display-graphic-p)
	    (dolist (charset '(kana han symbol cjk-misc bopomofo))
	    (set-fontset-font (frame-parameter nil 'font)
				charset
				(font-spec  :family imy/chinese-font :size imy/chinese-font-size))))

      
      )
  (progn

    (require 'init-no-dump)
    ))

(provide 'init-dump)
