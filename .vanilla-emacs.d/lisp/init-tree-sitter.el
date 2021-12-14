;;  -*- lexical-binding: t; -*-
(require 'tree-sitter)
(require 'tree-sitter-langs)

(add-hook 'c-mode-hook #'tree-sitter-hl-mode)

(provide 'init-tree-sitter)
