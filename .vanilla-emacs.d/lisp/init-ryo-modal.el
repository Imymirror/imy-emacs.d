;;  -*- lexical-binding: t; -*-

(global-set-key (kbd "<escape>") (lambda () (interactive) (ryo-modal-mode +1)))
(ryo-modal-key "SPC SPC"  'execute-extended-command)

(ryo-modal-keys
 ;; Misc
 ("0" "M-0")
 ("1" "M-1")
 ("2" "M-2")
 ("3" "M-3")
 ("4" "M-4")
 ("5" "M-5")
 ("6" "M-6")
 ("7" "M-7")
 ("8" "M-8")
 ("9" "M-9"))

(ryo-modal-key
 "SPC" '(
	 ("." find-file))) 

;; roam 
(ryo-modal-key
 "SPC" '(
	 ("n n" org-roam-node-find)
	 ("n i" org-roam-node-insert))) 

;; buffer
(ryo-modal-key
 "SPC" '(
	 ("b b" switch-to-buffer)
	 ("b k" kill-this-buffer)
	 ("b p" previous-buffer)
	 ("b n" next-buffer)
	 ("b s" save-some-buffers))) 

;; window
(ryo-modal-key
 "SPC" '(
	 ("w m" delete-other-windows)
	 ("w w" other-window)
	 ("w r" imi-window-jump-right )
	 ("w b" imi-window-jump-below )
	 ("w d"  delete-window)
	 ("w h" windmove-left )
	 ("w l" windmove-right )
	 ("w j" windmove-down )
	 ("w k" windmove-up ))) 

(ryo-modal-key
 "SPC" '(
	 ("f n" make-frame)
	 ("f d" delete-frame)
	 ))

;; consult/completion
(ryo-modal-key
 "SPC" '(
	 ("c l" consult-line)
	 ("c b" consult-buffer)
	 ("c L" consult-goto-line)
	 ("c o" consult-outline)
	 ("c i" consult-imenu)
	 ("c g" consult-grep)
	 ("c G" consult-git-grep)
	 ("c m" consult-multi-occur)
	 ("c M" consult-line-multi)
	 	 
	 ))



(ryo-modal-keys
 ("," ryo-modal-repeat)
 ("i" ryo-modal-mode)

 ;; Navigation
 ("h" backward-char)
 ("j" next-line)
 ("k" previous-line)
 ("l" forward-char)
 ("J" forward-paragraph)
 ("K" backward-paragraph)
 ("H" backward-sentence)
 ("L" forward-sentence)
 ("w" forward-to-word)
 ("b" backward-word)
 ("W" forward-sexp)
 ("B" backward-sexp)

 ("a" crux-move-beginning-of-line)  
 ("e" end-of-line)
 ("f" avy-goto-word-1)
 
 
 ("g g" beginning-of-buffer)
 ("G" end-of-buffer)

 ("g l" avy-goto-line)
 ("g m" pop-to-mark-command)
 
 ;; Editing/marking
 ("r" imi-replace-char-at-point)
 ("R" query-replace)
 ("u" undo)
 ("U" undo-redo)
 ("." er/expand-region)
 ("x" delete-char)
 ("X" kill-region)
 
 ("o" crux-smart-open-line :exit t)
 ("O" crux-smart-open-line-above :exit t)
 ("p" yank)
 ("P" yank-rectangle)
 ("N" imi-narrow-or-widen-dwim)

 ;; Change/replace (c keyword)
 ("c c" imi-change-current-line :exit t)
 ("c w" kill-word :exit t)
 ;; ("c l" avy-kill-whole-line :exit t)
 ("c b" backward-kill-word :exit t)
 ("c r" avy-kill-region :exit t)
 ("c a" crux-move-beginning-of-line :exit t)
 ("c e" end-of-line :exit t)
 ("c f" avy-goto-word-1 :name "avy-kill-word-1" :exit t :then '(kill-word))
 ("c o" avy-goto-line :then '(open-line) :exit t)

 ;; Killing (d verb)
 ("d d" crux-kill-whole-line)
 ("d w" kill-word)
 ("d l" avy-kill-whole-line)
 ("d b" backward-kill-word)
 ("d r" avy-kill-region)
 ("d J" kill-paragraph)
 ("d K" backward-kill-paragraph)
 ("d H" backward-kill-sentence)
 ("d L" kill-sentence)

 ;; Copying (y verb)
 ("Y" kill-ring-save)
 ("y y" imi-copy-line)
 ("y l" avy-kill-ring-save-whole-line)
 ("y w" kill-word :name "save-word" :then '(yank))

 ;; Programming and commenting
 ;;("i" hs-toggle-hiding)
 ;;("I" hs-hide-all)
 ;;("ö ö" evilnc-comment-or-uncomment-lines)
 ;;("ö p" evilnc-comment-or-uncomment-paragraphs)
 ;;("ö e" comment-dwim :exit t)
 ;;("s" dumb-jump-go)
 
 ;; Variant/clone/duplicate (v verb)
 ("v v" crux-duplicate-current-line-or-region)
 ("v o" crux-duplicate-and-comment-current-line-or-region)
 ("v l" avy-copy-line)
 ("v r" avy-copy-region)

 ;; Move (m verb)
 ("m m" imi-move-current-line)
 ("m r" avy-move-region)
 ("m l" avy-move-line)

 
 )


;; buffer
(global-set-key (kbd "s-0") #'winum-select-window-0)
(global-set-key (kbd "s-1") #'winum-select-window-1)
(global-set-key (kbd "s-2") #'winum-select-window-2)
(global-set-key (kbd "s-3") #'winum-select-window-3)
(global-set-key (kbd "s-4") #'winum-select-window-4)
(global-set-key (kbd "s-5") #'winum-select-window-5)
(global-set-key (kbd "s-6") #'winum-select-window-6)
(global-set-key (kbd "s-7") #'winum-select-window-7)
(global-set-key (kbd "s-8") #'winum-select-window-8)
(global-set-key (kbd "s-9") #'winum-select-window-9)

;; 这三个毫无用处
;;(ryo-modal-key "SPC o o"  'org-cycle :mode 'org-mode)
;;(ryo-modal-key "SPC o b"  'imi-worf-beginning-of-line :mode 'org-mode )
;;(ryo-modal-key "SPC o t"  'imi-worf-shifttab :mode 'org-mode )

(provide 'init-ryo-modal)
