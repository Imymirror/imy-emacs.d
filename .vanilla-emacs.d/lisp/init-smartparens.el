;;  -*- lexical-binding: t; -*-


;; from https://gist.github.com/mutyalads/19c54aa30a4a77c40af1677eeab1e3ab#file-emacs-init-L134
;; smart parenthesis
(use-package smartparens :straight t
  :init (smartparens-global-mode)
  :config
  (diminish 'smartparens-mode)
  (setq sp-interactive-dwim t)
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)

  ;; (sp-pair "(" ")" :wrap "C-(") ;; how do people live without this?
  ;; (sp-pair "[" "]" :wrap "s-[") ;; C-[ sends ESC
  ;; (sp-pair "{" "}" :wrap "C-{")

  ;; ;; WORKAROUND https://github.com/Fuco1/smartparens/issues/543
  ;; (bind-key "C-<left>" nil smartparens-mode-map)
  ;; (bind-key "C-<right>" nil smartparens-mode-map)

  ;; (bind-key "s-<delete>" 'sp-kill-sexp smartparens-mode-map)
  ;; (bind-key "s-<backspace>" 'sp-backward-kill-sexp smartparens-mode-map)

  )


(provide 'init-smartparens)
