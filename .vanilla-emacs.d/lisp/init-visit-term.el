;;  -*- lexical-binding: t; -*-
;; extract from crux package

(defun crux-start-or-switch-to (function buffer-name)
  "Invoke FUNCTION if there is no buffer with BUFFER-NAME.
      Otherwise switch to the buffer named BUFFER-NAME.  Don't clobber
      the current buffer."
  (if (not (get-buffer buffer-name))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (funcall function))
    (switch-to-buffer-other-window buffer-name)))

(defcustom crux-term-func
  #'crux-ansi-term
  "The function used to start the term buffer if it's not already running.

It will be called with a two arguments: the shell to start and the
expected name of the shell buffer."
  :type 'function
  :group 'crux)

(defun crux-ansi-term (buffer-name)
  "Use ansi-term for `crux-visit-term-buffer'"
  (ansi-term crux-shell buffer-name))

(defcustom crux-shell (getenv "SHELL")
  "The default shell to run with `crux-ansi-term'."
  :type 'string
  :group 'crux)


(defvar crux-term-buffer-name "ansi-term"
  "The default buffer name used by `crux-visit-term-buffer'.
This variable can be set via .dir-locals.el to provide multi-term support.")

(defun crux-visit-term-buffer ()
  "Create or visit a terminal buffer.
If the process in that buffer died, ask to restart."
  (interactive)
  (crux-start-or-switch-to (lambda ()
                             (apply crux-term-func (list crux-term-buffer-name)))
                           (format "*%s*" crux-term-buffer-name))
  (when (and (null (get-buffer-process (current-buffer)))
             (y-or-n-p "The process has died.  Do you want to restart it? "))
    (kill-buffer-and-window)
    (crux-visit-term-buffer)))


(provide 'init-visit-term)
