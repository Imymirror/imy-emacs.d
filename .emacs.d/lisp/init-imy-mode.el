;; init-imy-mode.el -*- lexical-binding: t; -*-

(make-variable-buffer-local
 (defvar foo-count 0
   "Number of foos inserted into the current buffer."))

(defun insert-foo ()
  (interactive)
  (setq foo-count (1+ foo-count))
  (insert "foo"))

;;;###autoload
(define-minor-mode imy-mode
  "imymirror mode : I create a mode by myself"
  :lighter " imy"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c f") 'insert-foo)
            (define-key map (kbd "C-c f") 'insert-foo)
            map))

;;;###autoload
(add-hook 'text-mode-hook 'foo-mode)

(provide 'init-imy-mode)
