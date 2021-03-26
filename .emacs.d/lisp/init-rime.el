;; init-rime.el -*- lexical-binding: t; -*-

;; posframe
(require 'posframe)

(setq rime-librime-root "~/.my-emacs-env/package-manual/librime/dist")

;; rime
(require 'rime)

(setq default-input-method "rime")
;; (setq rime-user-data-dir "~/Library/Rime")

(setq rime-posframe-properties
      (list
       :background-color "#333333"
       :foreground-color "#dcdccc"
       ;; :font "WenQuanYi Micro Hei Mono-14"
       :internal-border-width 10))

;; 默认值 
(setq rime-translate-keybindings
      '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "<prior>" "<next>" "<delete>"))


;; (setq rime-translate-keybindings
;;   '("C-f" "C-b" "C-n" "C-p" "C-g" "<left>" "<right>" "<up>" "<down>" "M-[" "M-]" "<delete>"))

(setq rime-show-candidate 'posframe)

(setq rime-disable-predicates
      '(rime-predicate-evil-mode-p
	rime-predicate-after-alphabet-char-p
	rime-predicate-evil-mode-p
	;; rime-predicate-prog-in-code-p
	)
      )


(setq imy/cursor-status 0)
(defun imy/rime-inline-ascii ()
  (interactive)
  (if (eq imy/cursor-status 0)
      (progn
	(setq imy/cursor-status 1)
	(set-cursor-color "chartreuse")
	)
    (progn
      (setq imy/cursor-status 0)
      (set-cursor-color "red")
      )
    )
  (rime-inline-ascii))

(general-define-key "C-M-s-:" 'imy/rime-inline-ascii) 

;; (defun activate-default-input-method ()
;;   (interactive)
;;   (activate-input-method default-input-method))
;; (add-hook 'text-mode-hook 'activate-default-input-method)

(add-hook 'after-change-major-mode-hook (lambda ()
					  (activate-input-method default-input-method))) 

(provide 'init-rime)

