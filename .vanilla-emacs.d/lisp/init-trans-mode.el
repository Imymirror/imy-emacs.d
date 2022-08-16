;;  -*- lexical-binding: t; -*-

;; (use-package trans-mode
;;   :load-path "site-lisp/trans-mode"
;;   :custom
;;   (trans-target "zh" "first target language is zh")
;;   (trans-second-target "en" "if source text language code equals first target, use the second target as an alternative.")
;;   :config
;;   (trans-install-target "ja") ;; ==> auto generate two new functions : trans-input-ja , trans-input-ja-popup
;;   )

(use-package trans-mode
  :straight
  (:host github :repo "Imymirror/trans-mode")
  :custom
  (trans-target "zh" "first target language is zh")
  (trans-second-target "en" "if source text language code equals first target, use the second target as an alternative.")
  :config
  (trans-install-target "ja") ;; ==> auto generate two new functions : trans-input-ja , trans-input-ja-popup
  )


(provide 'init-trans-mode)
