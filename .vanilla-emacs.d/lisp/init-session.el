;;  -*- lexical-binding: t; -*-

(make-frame)
(make-frame)
(make-frame)

(imi-frame-switch-by-number 1)
(imi-persp-switch-to-1)
(imi-frame-switch-by-number 2)
(imi-persp-switch-to-2)
(imi-frame-switch-by-number 3)
(imi-persp-switch-to-3)

(imi-frame-switch-by-number 1)

(provide 'init-session)
