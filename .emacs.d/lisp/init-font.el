;; init-font.el -*- lexical-binding: t; -*-

;; midnight blue | dim gray | sea green | cornflower blue | gold
;; (set-face-background 'hl-line "cornflower blue")

;; (set-face-attribute 'region nil
;;                     :box '(:line-width -1 
;;                            ;; :color "gtk_selection_bg_color"
;;                            :color "gray14"
;;                            :style nil))


(setq imy/english-font "Fira Code")
(setq imy/chinese-font "PingFang SC")
;; (setq imy/english-font "Sarasa Mono SC Nerd")
;; (setq imy/chinese-font "Sarasa Mono SC Nerd")
(setq imy/english-font-height (* 15 10))
(setq imy/chinese-font-size 15)


;; Setting English Font  - Fira Code | Inconsolata | Monoid  + Unifont | Sarasa Mono SC Nerd |  PinFang SC | Source Code Pro | Monaco | menlo
(set-face-attribute 'default nil :height imy/english-font-height :weight 'regular :family imy/english-font)

;; Chinese Font 配制中文字体 PingFang SC | Songti SC
(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec  :family imy/chinese-font :size imy/chinese-font-size))))

(provide 'init-font)
