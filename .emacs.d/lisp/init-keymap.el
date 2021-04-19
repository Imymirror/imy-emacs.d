(setq god-mode-enable-function-key-translation nil)
(require 'god-mode)
;; (god-mode)

(define-key god-local-mode-map (kbd ".") #'repeat)
(define-key god-local-mode-map (kbd "z") #'repeat)
(define-key god-local-mode-map (kbd "i") #'god-local-mode)

(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)

(defun my-god-mode-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook #'my-god-mode-update-cursor)
(add-hook 'god-mode-disabled-hook #'my-god-mode-update-cursor)

(require 'evil-god-state)
(evil-define-key 'god global-map [escape] 'evil-god-state-bail)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "fk"  'evil-execute-in-god-state) ;; , 
(key-chord-define-global "fj"  'evil-god-state)

(provide 'init-keymap)
