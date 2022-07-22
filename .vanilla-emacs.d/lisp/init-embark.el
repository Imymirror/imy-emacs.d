;;  -*- lexical-binding: t; -*-

(defun sanityinc/maybe-suspend-frame ()
  (interactive)
  (unless (and *is-a-mac* window-system)
    (suspend-frame)))

(global-set-key (kbd "C-z") 'sanityinc/maybe-suspend-frame)

(use-package embark :straight t
  :bind
  (
   ;("C-:" . embark-act)         ;; pick some comfortable binding
   ("M-." . embark-dwim)        ;; good alternative: M-.
   ;("C-\"" . embark-export)
   
   ("C-h B" . embark-bindings)
   :map vertico-map
   ("C-c C-o" . embark-export)
   ("C-c C-c" . embark-act)
   
   ) ;; alternative for `describe-bindings'
  :config

        ;; (define-key vertico-map (kbd "C-c C-o") 'embark-export)
	;; (define-key vertico-map (kbd "C-c C-c") 'embark-act)
	
  (require 'init-embark-leader-key)
  (require 'init-embark-consult-ouline-narrow)
  (require 'init-embark-which-key)
;;  (require 'init-embark-tab-switch)
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
