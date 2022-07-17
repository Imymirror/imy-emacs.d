;;  -*- lexical-binding: t; -*-


;; (use-package org-superstar :straight t :defer t :config   (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))


;; (use-package all-the-icons-completion
;;   :straight t
;;   :after (marginalia all-the-icons)
;;   :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
;;   :init (all-the-icons-completion-mode))

;; (require 'init-gtd)			        
;;  (require 'init-pomodoro)
;; (require 'init-tree-sitter)

;; (require 'init-corfu)

;; (use-package magit :straight t :bind ("C-c t m" . magit) :config (message "magit..."))

;; cmake-mode 影响启动时间接近 2s
;; (use-package cmake-mode :straight t :defer 2  :config (message "loading cmake-mode"))

;; (put 'scroll-left 'disabled nil)
;; (put 'downcase-region 'disabled nil)


(provide 'init-second-choice)
