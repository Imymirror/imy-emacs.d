;;  -*- lexical-binding: t; -*-

(use-package nov :straight t
             :init
             (defun mh/nov-font-setup ()
               (face-remap-add-relative 'variable-pitch :family "Source Code Pro"
                                        :height 1.0))
             :hook ((nov-mode . mh/nov-font-setup))
             :config
             (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))


(provide 'init-epub)
