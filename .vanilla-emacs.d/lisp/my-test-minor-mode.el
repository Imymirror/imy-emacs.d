;; my-test-minor-mode.el -*- lexical-binding: t; -*-

(defun imiprint (string)
  ""
  (message "imi : %s" string)
  )

(defun god-mode-self-insert ()
  "Handle self-insert keys."
  (interactive)
  ;; (imiprint (number-to-string (length (this-command-keys-vector)))  )
  ;; (imiprint (this-command-keys-vector ))

  (let* ((initial-key (aref (this-command-keys-vector)
                            (- (length (this-command-keys-vector)) 1)))
         ;; (binding (god-mode-lookup-key-sequence initial-key))
	 )

	 (imiprint initial-key)
    ;; (when binding
    ;;   ;; For now, set the shift-translation status only for alphabetic keys.
    ;;   (when (god-mode-upper-p initial-key)
    ;;     (setq this-command-keys-shift-translated t))
    ;;   (setq this-original-command binding)
    ;;   (setq this-command binding)
    ;;   ;; `real-this-command' is used by emacs to populate
    ;;   ;; `last-repeatable-command', which is used by `repeat'.
    ;;   (setq real-this-command binding)
    ;;   (setq god-literal-sequence nil)
    ;;   (if (commandp binding t)
    ;;       (call-interactively binding)
    ;;     (execute-kbd-macro binding)))

    ))


(defvar dotcrafter-local-mode-map
  (let ((map (make-sparse-keymap)))
    (suppress-keymap map t)
    (define-key map [remap self-insert-command] 'god-mode-self-insert)

    (define-key map (kbd "C-c C-j t") (lambda ()
					(interactive)
					(message "dotcrafter dotcrafter-local-mode-map binding used!")))
    map))

(define-minor-mode dotcrafter-mode
  "Toggles global dotcrafter-mode."
  nil   ; Initial value, nil for disabled
  :global t
  :group 'dotfiles
  :lighter " dotcrafter"
  :keymap
  dotcrafter-local-mode-map
  ;; (list (cons (kbd "C-c C-j t") (lambda ()
  ;; 				  (interactive)
  ;; 				  (message "dotcrafter key binding used!"))))

  (if dotcrafter-mode
      (message "dotcrafter-basic-mode activated!")
    (message "dotcrafter-basic-mode deactivated!")))

(add-hook 'dotcrafter-mode-hook (lambda () (message "Hook was executed!")))
(add-hook 'dotcrafter-mode-on-hook (lambda () (message "dotcrafter turned on!")))
(add-hook 'dotcrafter-mode-off-hook (lambda () (message "dotcrafter turned off!")))

(provide 'my-test-minor-mode)
