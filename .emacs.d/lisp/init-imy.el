;; init-imy.el -*- lexical-binding: t; -*-

;; 快速打开配置文件
(defun open-init-file() (interactive) (find-file (concat user-emacs-directory "init.el")))
(defun open-init-map-file() (interactive) (find-file (concat imy/lisp-dir  "init-map.el")))
(defun open-init-package-file() (interactive) (find-file (concat imy/lisp-dir  "init-package.el")))
(defun open-init-speedup-file() (interactive) (find-file (concat imy/lisp-dir  "init-speedup.el")))
(global-set-key (kbd "<f5>") 'open-init-file)
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


(defun imy/open-vterm nil
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 2))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (vterm))
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

(defun imy/kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (cl-remove-if-not 'buffer-file-name (buffer-list)))))

(defun imy/kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))


(defun imy/org-delete-link ()
    "Replace an org link by its description or if empty its address"
  (interactive)
  (if (org-in-regexp org-link-bracket-re 1)
      (save-excursion
        (let ((remove (list (match-beginning 0) (match-end 0)))
              (description
               (if (match-end 2) 
                   (org-match-string-no-properties 2)
                 (org-match-string-no-properties 1))))
          (apply 'delete-region remove)
          (insert description)))))


(defun imy/org-show-current-heading-tidily ()

  (interactive)
  "Show next entry, keeping other entries closed."
  (if (save-excursion (end-of-line) (outline-invisible-p))
      (progn (org-show-entry) (show-children))
    (outline-back-to-heading)
    (unless (and (bolp) (org-on-heading-p))
      (org-up-heading-safe)
      (hide-subtree)
      (error "Boundary reached"))
    (org-overview)
    (org-reveal t)
    (org-show-entry)
    (show-children)))

(defun imy/org-show-next-heading-tidily ()
  (interactive)
  "Show next entry, keeping other entries closed."
  (if (save-excursion (end-of-line) (outline-invisible-p))
      (progn (org-show-entry) (show-children))
    (outline-next-heading)
    (unless (and (bolp) (org-on-heading-p))
      (org-up-heading-safe)
      (hide-subtree)
      (error "Boundary reached"))
    (org-overview)
    (org-reveal t)
    (org-show-entry)
    (recenter-top-bottom)
    (show-children)
    (recenter-top-bottom)))

(defun imy/org-show-previous-heading-tidily ()
  "Show previous entry, keeping other entries closed."
  (interactive)
  (let ((pos (point)))
    (outline-previous-heading)
    (unless (and (< (point) pos) (bolp) (org-on-heading-p))
      (goto-char pos)
      (hide-subtree)
      (error "Boundary reached"))
    (org-overview)
    (org-reveal t)
    (org-show-entry)
    (recenter-top-bottom)
    (show-children)
    (recenter-top-bottom)))


(defun imy/org-foldup ()
  "Hide the entire subtree from root headline at point."
  (interactive)
  (while (ignore-errors (outline-up-heading 1)))
  (org-flag-subtree t))

(defun imy/org-shifttab (&optional arg)
  (interactive "P")
  (if (or (null (org-current-level))     ; point is before 1st heading, or
          (and (= 1 (org-current-level)) ; at level-1 heading, or
               (org-at-heading-p))
          (org-at-table-p))              ; in a table (to preserve cell movement)
      ; perform org-shifttab at root level elements and inside tables
      (org-shifttab arg)
      ; try to fold up elsewhere 
      (imy/org-foldup)))


(defun imy/delete-this-file (buffername)
  "Delete the file visited by the buffer named BUFFERNAME."
  (interactive "b")
  (let* ((buffer (get-buffer buffername))
         (filename (buffer-file-name buffer)))
    (when filename
      (delete-file filename)
      (kill-buffer-ask buffer))))

;; evil < > 
(defun imy/evil-shift-right ()
  (interactive)
  (evil-shift-right evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

(defun imy/evil-shift-left ()
  (interactive)
  (evil-shift-left evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))


(defun imy/avy-goto-char-near-point (char)
  "Jump to the currently visible CHAR in the few lines near point."
  (interactive (list (read-char "char: " t)))
  (let ((avy-all-windows nil) (p1 nil) (p2 nil) (initial-point (point)) (n 2))
    (avy-with avy-goto-char
      (avy--process
       (save-excursion
     (save-restriction
       (forward-line (- n))
       (setq p1 (point))
       (goto-char initial-point)
       (forward-line n)
       (setq p2 (point))
       (narrow-to-region p1 p2)
       (avy--regex-candidates (regexp-quote (string char)))))
     (avy--style-fn avy-style)))))


(defun imy/single-lines-only ()
  "replace multiple blank lines with a single one"
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "\n")
    (forward-char 1)))

(defun imy/remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "" nil t))))


(provide 'init-imy)

