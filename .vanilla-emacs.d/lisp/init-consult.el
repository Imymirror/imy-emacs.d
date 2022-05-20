;;  -*- lexical-binding: t; -*-

(use-package consult :straight t :commands execute-extended-command
  :bind (
   ("C-c s l" . consult-line)
   ("C-c s b" . consult-buffer)
   ("C-c s i" . consult-imenu)
   ("C-c s o" . consult-outline)
   ("C-c s g" . consult-ripgrep)
   ("C-c s f" . consult-find)
   ("C-c s r" . consult-recent-file)
   ("C-c s G" . consult-git-grep)))


(provide 'init-consult)
