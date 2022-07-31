;;  -*- lexical-binding: t; -*-
(use-package acme-theme :straight t
  :config
  (load-theme 'acme t))


(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(use-package dimmer :straight t
  :init
  :config

  (setq-default dimmer-fraction 0.15)
  (dimmer-mode)

  ;; (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all)))

  ;;   ;; Don't dim in terminal windows. Even with 256 colours it can
  ;;   ;; lead to poor contrast.  Better would be to vary dimmer-fraction
  ;;   ;; according to frame type.
  ;;   (defun sanityinc/display-non-graphic-p ()
  ;;     (not (display-graphic-p)))
  ;;   (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)
  )

(use-package rand-theme :straight t :defer 0.1
  :config
  (setq rand-theme-unwanted '(tsdh-light tsdh-dark doom-shades-of-purple doom-fairy-floss  tango-dark   doom-nova  light-blue manoj-dark ))
  (rand-theme)
)

(provide 'init-theme)
