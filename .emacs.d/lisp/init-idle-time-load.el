;; init-idle-time-load.el -*- lexical-binding: t; -*-

(defun imy/load-after-idle-time () 

  (load "server")
  (unless (server-running-p) (server-start))

  ;; (mac-auto-operator-composition-mode)


  ;; 通过分析语义增量选择 region 的插件
  (require 'expand-region)

  (require 'init-evil-surround)
  ;; (require 'init-agenda)
  (require 'init-journal)			      
  (require 'init-snippet)
  (require 'init-paredit)
  (require 'init-org-download)
  (require 'init-company)

  (require 'init-telega)
  (require 'init-language)
  (require 'init-window)
  (require 'init-which-key)
  (require 'init-org-mode)
  (require 'init-random-theme)
  (require 'init-fold)
  ;; (require 'init-pinyin)

  (require 'init-treemacs)
  (require 'init-elfeed)
  ;; (require 'init-nyan-mode)
  (require 'init-mode-line)
  (require 'init-enable-mode)

  (require 'init-terminal)

  ;; dump 不了, 只能放在 idle 里
  (winner-mode)

  (require 'init-roam2)
  (require 'init-capture)

  ;; 解决unicode字体相关的问题, 尤其在telega有些图标名字显示不出来
  (require 'unicode-fonts)
  (unicode-fonts-setup)
)

(imy/load-after-idle-time)

;; (setq  setup-idle-time-once
;;            (run-with-idle-timer 3 t
;;                                 (lambda ()
;;                                   (imy/load-after-idle-time)
;;                                   (cancel-timer setup-idle-time-once)
;;                                   )))





(provide 'init-idle-time-load)
