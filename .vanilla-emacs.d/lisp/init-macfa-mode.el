;;  -*- lexical-binding: t; -*-

;; (require 'init-mac-front-app)
;; (require 'macfa-mode)

(use-package macfa-mode
  :straight
  (:host github :repo "Imymirror/macfa-mode")
  :bind (
         :map macfa-mode-map
         ("C-c s s" . macfa-finder))
  :config
  (macfa/install-macfa "finder") ;; ==> macfa-finder . you can call directly by M-x macfa-finder
  ;; (define-key macfa-mode-map (kbd "C-c s s") 'macfa-finder)
  )

(provide 'init-macfa-mode)
