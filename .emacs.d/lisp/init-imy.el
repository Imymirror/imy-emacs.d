;; init-imy.el -*- lexical-binding: t; -*-

;; 快速打开配置文件
(defun open-init-file() (interactive) (find-file (concat user-emacs-directory "init.el")))
(defun open-init-map-file() (interactive) (find-file (concat imy/lisp-dir  "init-map.el")))
(defun open-init-package-file() (interactive) (find-file (concat imy/lisp-dir  "init-package.el")))
(defun open-init-speedup-file() (interactive) (find-file (concat imy/lisp-dir  "init-speedup.el")))
(global-set-key (kbd "<f1>") 'open-init-file)
(global-set-key (kbd "<f2>") 'open-init-map-file)
(global-set-key (kbd "<f3>") 'open-init-package-file)
(global-set-key (kbd "<f4>") 'open-init-speedup-file)


(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
	bufname)
    (while (progn
	     (setq bufname (concat "*scratch"
				   (if (= n 0) "" (int-to-string n))
				   "*"))
	     (setq n (1+ n))
	     (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (if (= n 1) (lisp-interaction-mode)) ; 1, because n was incremented
    ))

(defun imy/reveal-in-finder ()
  (interactive)
  (shell-command (concat "open -R " buffer-file-name)))

(defun imy/create-1/3-scratch-buffer nil
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (create-scratch-buffer))
)

(defun imy/eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    ;;(insert (concat "ls"))
    (eshell-send-input)))

(defun imy/eshell-close ()
  "Closes the winexitdow created by the function 'eshell-here'"
  (interactive)
  (evil-insert nil nil nil)
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(defun imy/open-iTerm ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (shell-command "open -a iTerm .")
)


(defun imy/make-frame-by-emacsclient ()
  "make frame by emacsclient -c"
  (interactive)
  (start-process-shell-command "make-frame" nil "emacsclient -c")
)

(provide 'init-imy)

