;; init-custom.el -*- lexical-binding: t; -*-

;; (setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(when (file-exists-p custom-file)
  (load custom-file))


(provide 'init-custom)
