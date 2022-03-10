;;  -*- lexical-binding: t; -*-
(use-package orderless
  :straight t
  :after vertico
  :config
  ;; from purcell
  (defun sanityinc/use-orderless-in-minibuffer ()
    (setq-local completion-styles '(substring orderless)))
  (add-hook 'minibuffer-setup-hook 'sanityinc/use-orderless-in-minibuffer)

  ;; https://github.com/oantolin/orderless
  (defun flex-if-twiddle (pattern _index _total)
    (when (string-suffix-p "~" pattern)
      `(orderless-flex . ,(substring pattern 0 -1))))

  (defun first-initialism (pattern index _total)
    (if (= index 0) 'orderless-initialism))

  (defun without-if-bang (pattern _index _total)
    (cond
     ((equal "!" pattern)
      '(orderless-literal . ""))
     ((string-prefix-p "!" pattern)
      `(orderless-without-literal . ,(substring pattern 1)))))

  ;; (setq orderless-matching-styles '(orderless-regexp))
  (setq orderless-style-dispatchers '(  without-if-bang ))


  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-ignore-case t))


(provide 'init-orderless)
