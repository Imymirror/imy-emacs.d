;;  -*- lexical-binding: t; -*-
;;This adds an action in consult-outline to narrow to the selected heading and expand it.

(defun my/consult-outline-narrow-heading (heading)
  "Narrow to and expand HEADING."
  (embark-consult-goto-location heading)
  (outline-mark-subtree)
  (and
   (use-region-p)
   (narrow-to-region (region-beginning) (region-end))
   (deactivate-mark))
  (outline-show-subtree))

(embark-define-keymap embark-consult-outline-map
  "Keymap for embark actions in `consult-outline'."
  ("r" my/consult-outline-narrow-heading))

(defun with-embark-consult-outline-map (fn &rest args)
  "Let-bind `embark-keymap-alist' to include `consult-location'."
  (let ((embark-keymap-alist
	   (cons '(consult-location . embark-consult-outline-map) embark-keymap-alist)))
    (apply fn args)))

(advice-add 'consult-outline :around #'with-embark-consult-outline-map)

(provide 'init-embark-consult-ouline-narrow)
