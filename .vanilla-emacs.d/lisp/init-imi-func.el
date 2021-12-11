;;  -*- lexical-binding: t; -*-

;; Taken from http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(defun imi-narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or
defun, whichever applies first. Narrowing to
org-src-block actually calls `org-edit-src-code'.
With prefix P, don't widen, just narrow even if buffer
is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning)
                           (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing
         ;; command. Remove this first conditional if
         ;; you don't want it.
         (cond ((ignore-errors (org-edit-src-code) t)
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (narrow-to-defun))))


(defun imi-replace-char-at-point ()
  "Like vim's replace command."
  (interactive)
  (delete-char 1)
  (insert " ")
  (backward-char 1)
  (message "Replace with char.")
  (setq-local cursor-type '(hbar . 3))
  (call-interactively #'quoted-insert)
  (setq-local cursor-type (default-value 'cursor-type))
  (delete-char 1)
  (backward-char 1))

(defun imi-change-current-line ()
  "Kill current line, but do not remove it."
  (interactive)
  (crux-move-beginning-of-line 1)
  (kill-line 1))


(defun imi-copy-line ()
  "Saves current line to kill ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (line-end-position)))

(defun imi-move-current-line ()
  "Kills line and move it using avy."
  (interactive)
  (let ((beg (beginning-of-line))
        (end (end-of-line)))
    (kill-whole-line)
    (avy-goto-line)
    (yank)))

;; worf from  https://github.com/abo-abo/worf/issues/14
(defun imi-worf-beginning-of-line ()
  "Replaces `org-beginning-of-line'.
When already at beginning of line, move back to heading."
  (interactive)
  (let ((pt (point)))
    (org-beginning-of-line)
    (when (and (eq pt (point))
               (not (looking-at "^[*]")))
      (push-mark)
      (re-search-backward "^*"))))

(defun imi-worf-beginning-of-line-version2()
  "Replaces `org-beginning-of-line'.
When already at beginning of line, move back to heading.
When at beginning of visual line, move to beginning of logical line."
  (interactive)
  (let ((pt (point)))
    (org-beginning-of-line)
    (when (eq pt (point))
      (cond ((looking-at "^[^*]")
             (push-mark)
             (re-search-backward "^*"))
            ((not (looking-at "^[*]"))
             (push-mark)
             (re-search-backward "^"))))))

(defun imi-worf-shifttab (arg)
  "Hide/show everything.
Forward to `org-shifttab' with ARG."
  (interactive "P")
  (if arg
      (org-content)
    (when (eq org-cycle-global-status 'overview)
      (setq org-cycle-global-status 'contents))
    (setq this-command last-command)
    (org-cycle-internal-global)))

;; window
(defun imi-window-jump-below ()
  "jump below and move cursor"
  (interactive)
  (split-window-vertically)
  (other-window 1)
  )

(defun imi-window-jump-right ()
  "jump below and move cursor"
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  )

(defun imi-reveal-in-finder ()
  (interactive)
  (shell-command (concat "open -R " buffer-file-name)))

(defun imi-open-iTerm ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (shell-command "open -a iTerm ."))

(defun imi-save-all-buffers () (interactive) (save-some-buffers t))

(defun imi-restart-emacs ()
  (interactive)
  (imi-save-all-buffers)
  (call-process "sh" nil nil nil "-c" "sh /Users/fuhongxue/project/vanilla-emacs/setup-vanilla-emacs-by-daemon.sh &")
  (save-buffers-kill-terminal))

;; from https://stackoverflow.com/questions/384284/how-do-i-rename-an-open-file-in-emacs
(defun imi-rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; from https://emacs.stackexchange.com/questions/31429/want-equivalent-of-vim-w-and-e
(defun imi-forward-word ()
  "Forward to the end of the 'word at point' (vim-like)."
  (interactive)
  (skip-syntax-forward "-")
  (skip-syntax-forward "^-"))

(defun imi-backward-word ()
  "Backward to the start of the 'word at point' (vim-like)."
  (interactive)
  (skip-syntax-backward "-")
  (skip-syntax-backward "^-"))

(defun imi-frame-switch-by-number (n)
  (select-frame-set-input-focus     (elt (visible-frame-list) n)))

(defun imi-close-perspective()
  (message (concat "Saving " imi-persp-path ))
  ;; telega confict with persp, don't save
  (when (telega-server-live-p)  (telega-kill 1) )  
  (persp-save-state-to-file imi-persp-path))

(add-hook 'kill-emacs-hook 'imi-close-perspective)


(defun imi-persp-switch-to-n (n)
  (let ((names (persp-names-current-frame-fast-ordered))
        (count 0))
    (dolist (name names)
      (when (= count n)
        (persp-switch name))
      (cl-incf count))))

(provide 'init-imi-func)
