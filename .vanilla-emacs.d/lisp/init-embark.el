;;  -*- lexical-binding: t; -*-

(use-package embark :straight t
  :bind
  (("C-:" . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :config
  (require 'init-embark-leader-key)
  (require 'init-embark-consult-ouline-narrow)
  (require 'init-embark-which-key)
  (require 'init-embark-tab-switch)
  (require 'init-embark-show-modeline-target))

;; Consult users will also want the embark-consult package.
(use-package embark-consult :straight t
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


(provide 'init-embark)
