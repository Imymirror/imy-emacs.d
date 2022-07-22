;;  -*- lexical-binding: t; -*-

(defmacro sanityinc/no-consult-preview (&rest cmds)
  `(with-eval-after-load 'consult
     (consult-customize ,@cmds :preview-key (kbd "M-P"))))


(require 'init-vertico)
(require 'init-consult)
(use-package marginalia :straight t :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle)) :init (marginalia-mode) :custom   (marginalia-max-relative-age 0))
(require 'init-embark)


(use-package affe :straight t
  :config
  ;; Manual preview key for `affe-grep'


  (defun sanityinc/affe-grep-at-point (&optional dir initial)
    (interactive (list prefix-arg (when-let ((s (symbol-at-point)))
                                    (symbol-name s))))
    (affe-grep dir initial))

  (consult-customize affe-grep :preview-key (kbd "M-."))
  (sanityinc/no-consult-preview affe-grep)
  (sanityinc/no-consult-preview sanityinc/affe-grep-at-point)
  (global-set-key (kbd "M-?") 'sanityinc/affe-grep-at-point))

(provide 'init-minibuffer)
