;;  -*- lexical-binding: t; -*-

(use-package tree-sitter
  :straight (tree-sitter :type git
                         :host github
                         :repo "ubolonton/emacs-tree-sitter"
                         :files ("lisp/*.el"))
  ;; :config (add-to-list 'tree-sitter-major-mode-language-alist '(rustic-mode . rust))
  ;; :hook ((python-mode rustic-mode) . tree-sitter-hl-mode)
  )

(use-package tree-sitter-langs
  :straight (tree-sitter-langs :type git
                               :host github
                               :repo "ubolonton/emacs-tree-sitter"
                               :files ("langs/*.el" "langs/queries"))
  :hook
  ((c-mode ) . tree-sitter-hl-mode)
  :after tree-sitter)


(provide 'init-tree-sitter)
