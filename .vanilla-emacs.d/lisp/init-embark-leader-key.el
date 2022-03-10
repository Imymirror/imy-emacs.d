;;  -*- lexical-binding: t; -*-

(defun embark-target-this-buffer-file ()
  (cons 'this-buffer-file (or (buffer-file-name) (buffer-name))))

(add-to-list 'embark-target-finders #'embark-target-this-buffer-file 'append)

(add-to-list 'embark-keymap-alist '(this-buffer-file . this-buffer-file-map))

(embark-define-keymap this-buffer-file-map
      "Commands to act on current file or buffer."
      ("l" load-file)
      ("b" byte-compile-file)
      ("S" sudo-find-file)
      ("r" rename-file-and-buffer)
      ("d" diff-buffer-with-file)
      ("=" ediff-buffers)
      ("C-=" ediff-files)
      ("!" shell-command)
      ("&" async-shell-command)
      ("x" consult-file-externally)
      ("c" copy-file)
      ("k" kill-buffer)
      ("z" bury-buffer)
      ("|" embark-shell-command-on-buffer)
      ("g" revert-buffer))

(defun embark-act-on-buffer-file (&optional arg)
  (interactive "P")
  (let ((embark-target-finders '(embark-target-this-buffer-file)))
    (embark-act arg)))

(global-set-key (kbd "C-c o e") 'embark-act-on-buffer-file)



(provide 'init-embark-leader-key)
