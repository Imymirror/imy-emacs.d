;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "C-,") 'embark-act)  ;; pick some comfortable binding
(global-set-key (kbd "C-;") 'embark-dwim) ;; good alternative: M-. 
(global-set-key (kbd "C-h B") 'embark-bindings)  ;; alternative for `describe-bindings' 


;; Narrow to heading in consult-outline
;; from https://github.com/oantolin/embark/wiki/Additional-Actions#narrow-to-heading-in-consult-outline
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

;; from https://github.com/oantolin/embark/wiki/Additional-Configuration#show-the-current-embark-target-types-in-the-modeline
(defvar embark--target-mode-timer nil)
(defvar embark--target-mode-string "")

(defun embark--target-mode-update ()
  (setq embark--target-mode-string
        (if-let (targets (embark--targets))
            (format "[%s%s] "
                    (propertize (symbol-name (plist-get (car targets) :type)) 'face 'bold)
                    (mapconcat (lambda (x) (format ", %s" (plist-get x :type)))
                               (cdr targets)
                               ""))
          "")))

(define-minor-mode embark-target-mode
  "Shows the current targets in the modeline."
  :global t
  (setq mode-line-misc-info (assq-delete-all 'embark-target-mode mode-line-misc-info))
  (when embark--target-mode-timer
    (cancel-timer embark--target-mode-timer)
    (setq embark--target-mode-timer nil))
  (when embark-target-mode
    (push '(embark-target-mode (:eval embark--target-mode-string)) mode-line-misc-info)
    (setq embark--target-mode-timer
          (run-with-idle-timer 0.1 t #'embark--target-mode-update))))


;; Switch between candidates and actions like in Helm
;; from https://github.com/oantolin/embark/wiki/Additional-Configuration#show-the-current-embark-target-types-in-the-modeline
(defun with-minibuffer-keymap (keymap)
  (lambda (fn &rest args)
    (minibuffer-with-setup-hook
        (lambda ()
          (use-local-map
           (make-composed-keymap keymap (current-local-map))))
      (apply fn args))))

(defvar embark-completing-read-prompter-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<tab>") 'abort-recursive-edit)
    map))

(advice-add 'embark-completing-read-prompter :around
            (with-minibuffer-keymap embark-completing-read-prompter-map))
(define-key vertico-map (kbd "<tab>") 'embark-act-with-completing-read)

  (defun embark-act-with-completing-read (&optional arg)
    (interactive "P")
    (let* ((embark-prompter 'embark-completing-read-prompter)
           (act (propertize "Act" 'face 'highlight))
           (embark-indicator (lambda (_keymap targets) nil)))
      (embark-act arg)))

(provide 'init-embark)
