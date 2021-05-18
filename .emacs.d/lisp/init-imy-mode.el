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
            map))

;;;###autoload
;; (add-hook 'text-mode-hook 'foo-mode)


(defun local-set-minor-mode-key (mode key def)
  "Overrides a minor mode keybinding for the local
   buffer, by creating or altering keymaps stored in buffer-local
   `minor-mode-overriding-map-alist'."
  (let* ((oldmap (cdr (assoc mode minor-mode-map-alist)))
         (newmap (or (cdr (assoc mode minor-mode-overriding-map-alist))
                     (let ((map (make-sparse-keymap)))
                       (set-keymap-parent map oldmap)
                       (push `(,mode . ,map) minor-mode-overriding-map-alist) 
                       map))))
    (define-key newmap key def)))

(local-set-minor-mode-key 'imy-mode (kbd "C-c j") 'insert-foo)
(local-set-minor-mode-key 'imy-mode (kbd "<SPC> j") 'insert-foo)

(provide 'init-imy-mode)
