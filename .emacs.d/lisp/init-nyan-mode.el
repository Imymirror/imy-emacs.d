;; init-nyan-mode.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (concat imy/package-manual-dir "nyan-mode"))
(require 'nyan-mode)
(nyan-mode)

;; (add-to-list 'mode-line-format   '(:eval (list (nyan-create))))

(setq nyan-animation-frame-interval 2)
;; (setq nyan-wavy-trail nil)

(define-minor-mode mood-line-mode
  "Toggle mood-line on or off."
  :group 'mood-line
  :global t
  :lighter nil
  (if mood-line-mode
      (progn

        ;; Setup flycheck hooks
        (add-hook 'flycheck-status-changed-functions #'mood-line--update-flycheck-segment)
        (add-hook 'flycheck-mode-hook #'mood-line--update-flycheck-segment)

        ;; Setup VC hooks
        (add-hook 'find-file-hook #'mood-line--update-vc-segment)
        (add-hook 'after-save-hook #'mood-line--update-vc-segment)
        (advice-add #'vc-refresh-state :after #'mood-line--update-vc-segment)

        ;; Set the new mode-line-format
        (setq-default mode-line-format
                      '((:eval
                         (mood-line--format
                          ;; Left
                          (format-mode-line
                           '(" "
                             (:eval (mood-line-segment-modified))
                             (:eval (mood-line-segment-buffer-name))
                             (:eval (mood-line-segment-anzu))
			     (:eval (mood-line-segment-multiple-cursors))
			     (:eval (mood-line-segment-position))

			     (:eval (list (nyan-create)))
			     " "
			     )
			   )

			  
                          ;; Right
                          (format-mode-line
                           '((:eval (mood-line-segment-eol))
                             (:eval (mood-line-segment-encoding))
                             (:eval (mood-line-segment-vc))
                             (:eval (mood-line-segment-major-mode))
                             (:eval (mood-line-segment-misc-info))
                             (:eval (mood-line-segment-flycheck))
                             (:eval (mood-line-segment-flymake))
                             (:eval (mood-line-segment-process))
                             " ")))))))
    (progn

      ;; Remove flycheck hooks
      (remove-hook 'flycheck-status-changed-functions #'mood-line--update-flycheck-segment)
      (remove-hook 'flycheck-mode-hook #'mood-line--update-flycheck-segment)

      ;; Remove VC hooks
      (remove-hook 'file-find-hook #'mood-line--update-vc-segment)
      (remove-hook 'after-save-hook #'mood-line--update-vc-segment)
      (advice-remove #'vc-refresh-state #'mood-line--update-vc-segment)

      ;; Restore the original mode-line format
      (setq-default mode-line-format mood-line--default-mode-line))))

(provide 'init-nyan-mode)
