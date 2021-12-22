;;  -*- lexical-binding: t; -*-

(consult-theme 'wheatgrass)

(setq consult-project-root-function
      (lambda ()
        (when-let (project (project-current))
          (car (project-roots project)))))

(provide 'init-consult)
