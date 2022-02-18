;;  -*- lexical-binding: t; -*-

(require 'meow)

;; (global-set-key (kbd "C-M-s-)") 'telega) 
(global-set-key (kbd "C-M-c") 'ace-pinyin-jump-char) 
(global-set-key (kbd "C-M-l") 'avy-goto-line) 

;; buffer
(global-set-key (kbd "s-0") 'treemacs-select-window)
(global-set-key (kbd "s-1") (lambda () (interactive) (imi/frame-switch-by-number 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (imi/frame-switch-by-number 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (imi/frame-switch-by-number 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (imi/frame-switch-by-number 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (imi/frame-switch-by-number 5)))
(global-set-key (kbd "s-6") (lambda () (interactive) (imi/frame-switch-by-number 6)))
(global-set-key (kbd "s-7") (lambda () (interactive) (imi/frame-switch-by-number 7)))
(global-set-key (kbd "s-8") (lambda () (interactive) (imi/frame-switch-by-number 8)))
(global-set-key (kbd "s-9") (lambda () (interactive) (imi/frame-switch-by-number 9)))

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  
  (meow-motion-overwrite-define-key
   '("<escape>" . ignore)
   '("j" . meow-next)
   '("k" . meow-prev))
  
  (meow-leader-define-key
   
   ;;'("/" . meow-keypad-describe-key)
   ;;'("?" . meow-cheatsheet)
   '("." . find-file)

   ;; automation
   '(  "a e" . imi/backup-emacs)
   '(  "a z" . imi/backup-zotero)
   '(  "a m" . imi/org-mind-map-open-html)
   '(  "a b e" . imi/blog-export)
   '(  "a b p" . imi/blog-publish)

   ;; consult
   '(  "s l" . consult-line)
   '(  "s b" . consult-buffer)
   '(  "s i" . consult-imenu)
   '(  "s o" . consult-outline)
   '(  "s g" . consult-ripgrep)
   '(  "s f" . consult-find)
   '(  "s r" . consult-recent-file)
   '(  "s R" . rg)
   '(  "s G" . consult-git-grep)
   
   ;; surround
   '(  "S t" . imi/surround-tilde)
   '(  "S S" . imi/surround-pair)

   
   ;; frame
   '(  "f n" . make-frame)
   '(  "f d" . delete-frame)


   ;; window
   '(  "w m" . delete-other-windows)
   '(  "w w" . other-window)
   '(  "w r" . imi/window-jump-right)
   '(  "w b" . imi/window-jump-below)
   '(  "w d" . delete-window)
   '(  "w h" . windmove-left)
   '(  "w l" . windmove-right)
   '(  "w j" . windmove-down)
   '(  "w k" . windmove-up)
   '(  "w H" . buf-move-left)
   '(  "w L" . buf-move-right)
   '(  "w J" . buf-move-down)
   '(  "w K" . buf-move-up)
   '(  "w u" . winner-undo)
   '(  "w U" . winner-redo)

   ;; roam
   '(  "n n" . org-roam-node-find)
   '(  "n t" . org-roam-tag-add)
   '(  "n i" . org-roam-node-insert)
   '(  "n S" . org-roam-db-sync)
   '(  "n s" . imi/switch-roam-engineer)
   '(  "n d" . org-roam-dailies-map)
   '(  "n f c" . (lambda () (interactive) (org-roam-node-find nil "#collection ") ))
   '(  "n f n" . (lambda () (interactive) (org-roam-node-find nil "#note ") ))
   

   ;; buffer
   '(  "b p" . persp-switch-to-buffer)
   '(  "b b" . switch-to-buffer)
   '(  "b k" . kill-this-buffer)
   '(  "b p" . previous-buffer)
   '(  "b n" . next-buffer)
   '(  "b s" . imi/save-all-buffers)

   ;; toggle
   '(  "t f" . hs-hide-block)
   '(  "t F" . hs-show-block)
   '(  "t r" . imi/restart-emacs)
   '(  "t e" . eval-buffer)
   
   ;; org/toggle
   '(  "o I" . imi/open-iTerm)
   '(  "o p" . imi/org-download-paste-clipboard)
   '(  "o s" . eshell)
   '(  "o l" . link-hint-open-link)
   ;; '(  "o g" . grab-mac-link-dwim)
   '(  "o G" . magit-status)
   '(  "o o" . imi/reveal-in-finder)
   '(  "o h" . org-hide-block-all)
   '(  "o i" . org-toggle-inline-images)
   '(  "o L" . org-toggle-link-display)
   '(  "o f" . org-footnote-new)
   '(  "o F" . org-footnote-goto-definition)
   '(  "o y" . yas-insert-snippet)
   
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")

   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)

   )
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)

   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))

(meow-global-mode 1)

(with-eval-after-load "meow"
  (setq meow-esc-delay 0.001)
  (setq meow-grab-fill-commands nil)
  (meow-setup)
;;  (meow-setup-indicator)
  )

(provide 'init-meow)
