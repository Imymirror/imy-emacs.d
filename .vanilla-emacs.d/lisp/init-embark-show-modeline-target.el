;;  -*- lexical-binding: t; -*-

(defvar embark--target-mode-timer nil)
(defvar embark--target-mode-string "")

(defun embark--target-mode-update ()
  (setq embark--target-mode-string
        (if-let (targets (embark--targets))
            (format "[%s%s] "
                    (propertize (symbol-name (plist-get (car targets) :type)) 'face 'bold)
                    (mapconcat (lambda (x) (format ", %s" (plist-get x :type)))
                               (cdr targets)
                               ""))
          "")))

(define-minor-mode embark-target-mode
  "Shows the current targets in the modeline."
  :global t
  (setq mode-line-misc-info (assq-delete-all 'embark-target-mode mode-line-misc-info))
  (when embark--target-mode-timer
    (cancel-timer embark--target-mode-timer)
    (setq embark--target-mode-timer nil))
  (when embark-target-mode
    (push '(embark-target-mode (:eval embark--target-mode-string)) mode-line-misc-info)
    (setq embark--target-mode-timer
          (run-with-idle-timer 0.1 t #'embark--target-mode-update))))


(provide 'init-embark-show-modeline-target)
