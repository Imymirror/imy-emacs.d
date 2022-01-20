;;  -*- lexical-binding: t; -*-

(require 'org-mind-map)

(defun imi/org-mind-map-open-filename (treenamep)
  "Return a default filename for saving the tree diagram.
If TREENAMEP is non-nil include in the filename the name of the top level header of the tree."
  (concat (file-name-sans-extension (buffer-name))
	  ""
	  (if treenamep
	      (concat "-"
		      (replace-regexp-in-string " +" "_" (nth 4 (org-heading-components)))))))


(defun imi/org-mind-map-open-html ()
  "open org mind map html"
  (interactive)
  (let* ((output-filename (concat "./mindmap/" (imi/org-mind-map-open-filename nil))))
    (message output-filename)
    (start-process "" nil "markmap"  (concat output-filename ".md"))))

;; (require 'ox-freemind) ;; 有缺陷，headerline 的层级过深就会消失
(defun imi/org-mind-map-write (&optional promptp)
  "Create a digraph based on all org trees in the current buffer.
The digraph will be named the same name as the current buffer.
To customize, see the org-mind-map group.
If called with prefix arg (or PROMPTP is non-nil), then call `org-mind-map-write-with-prompt'."
  (interactive "P")
  (let ((output-filename (concat "./mindmap/" (org-mind-map-default-filename nil))))
    (org-mind-map-write-named  output-filename)))

(defun imi/org-mind-map-open ()
  "open org mind map pdf"
  (interactive)
  (let* ((output-filename (concat "./mindmap/" (org-mind-map-default-filename nil))))
    (start-process "" nil "open"  (concat output-filename ".pdf"))))

(provide 'init-mind-map)
