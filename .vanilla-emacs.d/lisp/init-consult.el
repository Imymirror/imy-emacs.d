;;  -*- lexical-binding: t; -*-

(use-package consult :straight t 
  :bind (
	 ("C-c s l" . consult-line)
	 ("C-c s b" . consult-buffer)
	 ("C-c s B" . consult-project-buffer) 
	 ("C-c s i" . consult-imenu)
	 ("C-c s o" . consult-outline)
	 ("C-c s g" . consult-ripgrep)
	 ("C-c s f" . consult-find)
	 ("C-c s r" . consult-recent-file)
	 ("C-c s G" . consult-git-grep))
  :config
  (sanityinc/no-consult-preview
   consult-ripgrep
   consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref consult--source-recent-file consult--source-project-recent-file consult--source-bookmark)

  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line)

  )



(provide 'init-consult)
