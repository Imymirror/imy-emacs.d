;;  -*- lexical-binding: t; -*-

(defun imi-project-vc-override (dir)
  (let ((override (locate-dominating-file dir ".project.el")))
    (if override
        (cons 'vc override)
      nil)))

(add-hook 'project-find-functions #'zkj-project-override)

(provide 'init-project)
