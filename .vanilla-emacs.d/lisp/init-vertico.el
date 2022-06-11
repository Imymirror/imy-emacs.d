;;  -*- lexical-binding: t; -*-

(defun dw/minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a word"
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
    (delete-word (- arg))))


(use-package vertico
  :straight ( vertico :files (:defaults "extensions/*")
              :includes (vertico-buffer
                         vertico-directory
                         vertico-flat
                         vertico-indexed
                         vertico-mouse
                         vertico-quick
                         vertico-repeat
                         vertico-reverse)
	      )
  :bind (:map minibuffer-local-map
	      ("M-<backspace>" . dw/minibuffer-backward-kill))
  :init (vertico-mode))




;;  (vertico-mode)
;; (require 'vertico-buffer)

;; (setq completion-styles '(orderless)
;;       completion-category-defaults nil
;;       completion-category-overrides '((file (styles partial-completion))))


(provide 'init-vertico)
