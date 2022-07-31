;;  -*- lexical-binding: t; -*-

(defun imi/byte-recompile-file (filename)
  (interactive "fByte recompile file: ")
  (if (file-newer-than-file-p filename (concat filename "c"))
      (byte-compile-file filename) t))

(defun imi/byte-recompile-directory (directory)
  (if (file-directory-p directory)
      (byte-recompile-directory directory 0) t))

(defun imi/byte-recompile-init-files ()
  "Recompile all the init files."
  (interactive)
  (imi/byte-recompile-file user-init-file)
  (imi/byte-recompile-directory imi/lisp-dir)
  (imi/byte-recompile-directory imi/site-lisp-dir)
  t)

(provide 'init-byte-compilation)
