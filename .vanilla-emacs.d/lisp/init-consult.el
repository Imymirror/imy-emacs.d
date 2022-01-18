;;  -*- lexical-binding: t; -*-

(consult-theme 'doom-rouge)

(setq consult-project-root-function
      (lambda ()
        (when-let (project (project-current))
          (car (project-roots project)))))

(provide 'init-consult)
