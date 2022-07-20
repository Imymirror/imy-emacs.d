;;  -*- lexical-binding: t; -*-

;; Taken from http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html
(defun imi/narrow-or-widen-dwim (p)
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


(defun imi/replace-char-at-point ()
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

(defun imi/change-current-line ()
  "Kill current line, but do not remove it."
  (interactive)
  (crux-move-beginning-of-line 1)
  (kill-line 1))


(defun imi/copy-line ()
  "Saves current line to kill ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (line-end-position)))

(defun imi/move-current-line ()
  "Kills line and move it using avy."
  (interactive)
  (let ((beg (beginning-of-line))
        (end (end-of-line)))
    (kill-whole-line)
    (avy-goto-line)
    (yank)))

;; worf from  https://github.com/abo-abo/worf/issues/14
(defun imi/worf-beginning-of-line ()
  "Replaces `org-beginning-of-line'.
When already at beginning of line, move back to heading."
  (interactive)
  (let ((pt (point)))
    (org-beginning-of-line)
    (when (and (eq pt (point))
               (not (looking-at "^[*]")))
      (push-mark)
      (re-search-backward "^*"))))

(defun imi/worf-beginning-of-line-version2()
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

(defun imi/worf-shifttab (arg)
  "Hide/show everything.
Forward to `org-shifttab' with ARG."
  (interactive "P")
  (if arg
      (org-content)
    (when (eq org-cycle-global-status 'overview)
      (setq org-cycle-global-status 'contents))
    (setq this-command last-command)
    (org-cycle-internal-global)))


(defun imi/reveal-in-finder ()
  (interactive)
  (shell-command (concat "open -R " buffer-file-name)))

(defun imi/reveal-in-finder-directory ()
  (interactive)
  (let ((path (or (buffer-file-name) (dired-file-name-at-point)))
        dir file)
    (when path
      (setq dir (file-name-directory path))
      (setq file (file-name-nondirectory path)))
    (open-finder-1 dir file)))

(defun open-finder-1 (dir file)
  (let ((script
         (if file
             (concat
              "tell application \"Finder\"\n"
              " set frontmost to true\n"
              " make new Finder window to (POSIX file \"" (expand-file-name dir) "\")\n"
              " select file \"" file "\"\n"
              "end tell\n")
           (concat
            "tell application \"Finder\"\n"
            " set frontmost to true\n"
            " make new Finder window to {path to desktop folder}\n"
            "end tell\n"))))
    (start-process "osascript-getinfo" nil "osascript" "-e" script)))



(defun imi/open-iTerm ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (shell-command "open -a iTerm ."))

(defun imi/save-all-buffers () (interactive) (save-some-buffers t))

(defun imi/restart-emacs ()
  (interactive)
  (imi/save-all-buffers)
  (call-process "sh" nil nil nil "-c" "sh /Users/fuhongxue/.emacs.d/shell/restart.sh &")
  (save-buffers-kill-terminal))

;; from https://stackoverflow.com/questions/384284/how-do-i-rename-an-open-file-in-emacs
(defun imi/rename-file-and-buffer (new-name)
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

(defun imi/delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;; from https://emacs.stackexchange.com/questions/31429/want-equivalent-of-vim-w-and-e
(defun imi/forward-word ()
  "Forward to the end of the 'word at point' (vim-like)."
  (interactive)
  (skip-syntax-forward "-")
  (skip-syntax-forward "^-"))

(defun imi/backward-word ()
  "Backward to the start of the 'word at point' (vim-like)."
  (interactive)
  (skip-syntax-backward "-")
  (skip-syntax-backward "^-"))

(defun imi/frame-switch-by-number (n)
  (select-frame-set-input-focus     (elt (visible-frame-list) n)))

(defun imi/org-delete-link ()
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

;; from https://superuser.com/questions/895920/how-can-i-close-all-buffers-in-emacs
;; clean-buffer-list : By default it cleans buffers that have not been accessed for 3 days (or 1 hour, in the case of some special buffers)
(defun imi/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun imi/kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; from https://github.com/tshu-w/.emacs.d/blob/master/lisp/core-funcs.el#L163
(defun open-file-in-external-app (file-path)
  "Open FILE-PATH in external application."
  (cond
   ((eq system-type 'windows-nt)
    (w32-shell-execute "open" (replace-regexp-in-string "/" "\\\\" file-path)))
   ((eq system-type 'darwin) (shell-command (format "open \"%s\"" file-path)))
   ((eq system-type 'gnu/linux) (let ((process-connection-type nil))
                                  (start-process "" nil "xdg-open" file-path)))))

(defun open-file-or-directory-in-external-app (arg)
  "Open current file in external application.
If the universal prefix argument is used then open the folder
containing the current file by the default explorer."
  (interactive "P")
  (if arg
      (open-file-in-external-app (expand-file-name default-directory))
    (let ((file-path (if (derived-mode-p 'dired-mode)
                         (dired-get-file-for-visit)
                       buffer-file-name)))
      (if file-path
          (open-file-in-external-app file-path)
        (message "No file associated to this buffer.")))))



;; from https://www.emacswiki.org/emacs/SurroundRegion
(defun imi/surround (begin end open close)
  "Put OPEN at START and CLOSE at END of the region.
If you omit CLOSE, it will reuse OPEN."
  ;;  (interactive  "r\nsStart: \nsEnd: ")
  (when (string= close "")
    (setq close open))
  (save-excursion
    (goto-char end)
    (insert close)
    (goto-char begin)
    (insert open)))

(defun imi/surround-pair (begin end schar)
  "Surround with schar"
  (interactive "r\nsChar: \n")
  (imi/surround begin end schar schar))

(defun imi/surround-tilde (begin end)
  "Surround with tilde."
  (interactive "r\n")
  (imi/surround begin end " ~" "~ "))

(defun imi/print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

;;from https://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun imi/copy-file-path-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun imi/copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new (file-name-nondirectory filename) )
      (message "Copied buffer file name '%s' to the clipboard." (file-name-nondirectory filename) ))))

(defun imi/copy-file-name-sans-extension-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new (file-name-sans-extension (file-name-nondirectory filename)) )
      (message "Copied buffer file name '%s' to the clipboard." (file-name-sans-extension (file-name-nondirectory filename)) ))))

(defun imi/delete-blank-lines-in-region ()
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))

    (delete-blank-lines)

    (while (not (= (point) (point-max)))
      (forward-line) 
      (delete-blank-lines))))

(defun imi/my-term ()
  (interactive)
  (term "/bin/zsh"))

(defun imi/ask-before-closing ()
  "Prompt for confirmation for emacsclient(not daemon) like confirm-kill-emacs for running Emacs without daemon."
  (interactive)
  (if (y-or-n-p (format "Really exit Emacs? "))
      (save-buffers-kill-terminal)
    (message "Canceled frame close!")))


;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun imi/revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun imi/copy-org-link ()
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context))
         (beg (org-element-property :begin context))
         (end (org-element-property :end context)))
    (when (eq type 'link)
      (copy-region-as-kill beg end))))

(defun imi/save-macro (name)
  "save a macro. Take a name as argument
       and save the last defined macro under
       this name at the end of your .emacs"
  (interactive "SName of the macro: ")  ; ask for the name of the macro
  (kmacro-name-last-macro name)         ; use this name for the macro
  (insert-kbd-macro name))               ; copy the macro

(provide 'init-imi-func)
