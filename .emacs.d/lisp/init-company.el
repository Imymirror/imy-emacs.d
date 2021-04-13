;; init-company.el -*- lexical-binding: t; -*-

;; (with-eval-after-load 'company

;; 优化性能
(setq company-minimum-prefix-length 1
      company-idle-delay 0.5) ;; default is 0.2

(setq company-auto-complete t)
(setq company-show-numbers t)
;; )

(provide 'init-company)
