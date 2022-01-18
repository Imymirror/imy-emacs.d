;; init-org-mode.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook 'org-indent-mode)
(setq grab-mac-link-dwim-favourite-app 'chrome)

(setq org-footnote-auto-adjust t)

(require 'ox-org) 
(require 'org-mind-map)

(defun imi-org-mind-map-write (&optional promptp)
  "Create a digraph based on all org trees in the current buffer.
The digraph will be named the same name as the current buffer.
To customize, see the org-mind-map group.
If called with prefix arg (or PROMPTP is non-nil), then call `org-mind-map-write-with-prompt'."
  (interactive "P")
  (let ((output-filename (concat "./mindmap/" (org-mind-map-default-filename nil))))
    (org-mind-map-write-named  output-filename)))

(defun imi-org-mind-map-open ()
  "open org mind map pdf"
  (interactive)
  (let* ((output-filename (concat "./mindmap/" (org-mind-map-default-filename nil)))
	)
    (start-process "" nil "open"  (concat output-filename ".pdf"))
        ))


(require 'ox-freemind)

(provide 'init-org-mode)
