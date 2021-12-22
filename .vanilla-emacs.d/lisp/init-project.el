;;  -*- lexical-binding: t; -*-

(defun imi-project-vc-override (dir)
  (let ((override (locate-dominating-file dir ".project")))
    (if override
        (cons 'vc override)
      nil)))

(add-hook 'project-find-functions #'imi-project-vc-override)

(provide 'init-project)
