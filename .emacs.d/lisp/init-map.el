;; init-map.el -*- lexical-binding: t; -*-


(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map  (kbd "C-v") nil) ;; evil-visual-block
  (define-key evil-motion-state-map  (kbd "SPC") nil) ;; evil-visual-block
  (define-key evil-motion-state-map  (kbd ";") nil) ;;'evil-repeat-find-char)
  (define-key evil-motion-state-map  (kbd "C-e") nil)
  (define-key evil-motion-state-map  (kbd "TAB") nil)
  (define-key evil-normal-state-map  (kbd "s") nil) ;; evil-substitute
  )

(general-define-key "C-; d" 'ivy-immediate-done)

(general-create-definer my-leader-def :prefix "SPC")
(general-create-definer roam-leader-def :prefix ";")
(general-create-definer s-leader-def :prefix "s")
(general-create-definer g-leader-def :prefix "g")
(my-leader-def 'normal 'override "SPC" 'counsel-M-x)
(my-leader-def 'normal 'override "`" 'repeat)
(general-define-key "M-x" 'counsel-M-x)



(with-eval-after-load 'counsel
  (define-key counsel-find-file-map  (kbd "TAB") #'ivy-alt-done))

(general-define-key "C-x C-f" 'counsel-find-file) 

(my-leader-def 'normal 'override "." 'counsel-find-file)
(my-leader-def 'normal 'override "'" 'ivy-resume)
(my-leader-def  'normal ";" 'evil-repeat-find-char) 

;; general
(general-def 'insert  "C-v" 'org-yank) 
(general-def  'normal "C-v" 'org-yank) 

;;telega
(general-define-key "C-M-s-)" 'telega) 

;; macos
 (setq mac-option-key-is-meta t
       x-select-enable-clipboard 't
       ;; mac-command-key-is-meta nil
       mac-command-modifier 'super
       mac-option-modifier 'meta)

;; help
 (my-leader-def 'normal 'override "h t" 'counsel-load-theme)
 (my-leader-def 'normal 'override "h v" 'counsel-describe-variable)
 (my-leader-def 'normal 'override "h k" 'describe-key)
 (my-leader-def 'normal 'override "h f" 'counsel-describe-function)
 
 ;; buffer

(my-leader-def 'normal 'override "x" 'imy/create-1/3-scratch-buffer)
(my-leader-def 'normal 'override "b b" 'counsel-switch-buffer)
(my-leader-def 'normal 'override "b s" 'save-buffer)
(my-leader-def 'normal 'override "b S" 'evil-write-all)
(my-leader-def 'normal 'override "b k" 'kill-current-buffer)
(my-leader-def 'normal 'override "b d" 'kill-current-buffer)
(my-leader-def 'normal 'override "b p" 'previous-buffer)
(my-leader-def 'normal 'override "b n" 'next-buffer)
(my-leader-def 'normal 'override "b i" 'ibuffer)
 
 ;; window
 (my-leader-def 'normal 'override "w w" 'other-window)
 (my-leader-def 'normal 'override "w d" 'delete-window)
 (my-leader-def 'normal 'override "w m" 'delete-other-windows)
 (my-leader-def 'normal 'override "w D" 'delete-other-windows)
 (my-leader-def 'normal 'override "w b" '(lambda () (interactive) (split-window-vertically) (other-window 1)))
 (my-leader-def 'normal 'override "w r" '(lambda () (interactive) (split-window-horizontally) (other-window 1)))
 (my-leader-def 'normal 'override "w <" 'scroll-left)
 (my-leader-def 'normal 'override "w >" 'scroll-right)
 (my-leader-def 'normal 'override "w }" 'enlarge-window-horizontally)
 (my-leader-def 'normal 'override "w {" 'shrink-window-horizontally)
 (my-leader-def 'normal 'override "w H" 'evil-window-move-far-left)
 (my-leader-def 'normal 'override "w L" 'evil-window-move-far-right)
 (my-leader-def 'normal 'override "w J" 'evil-window-move-very-bottom)
 (my-leader-def 'normal 'override "w K" 'evil-window-move-very-top)
 (my-leader-def 'normal 'override "w h" 'evil-window-left)
 (my-leader-def 'normal 'override "w l" 'evil-window-right)
 (my-leader-def 'normal 'override "w j" 'evil-window-down)
 (my-leader-def 'normal 'override "w k" 'evil-window-up)
 (my-leader-def 'normal 'override "w a" 'winner-undo)
 (my-leader-def 'normal 'override "w f" 'winner-redo)

(my-leader-def 'normal 'override "1" 'winum-select-window-1)
(my-leader-def 'normal 'override "2" 'winum-select-window-2)
(my-leader-def 'normal 'override "3" 'winum-select-window-3)
(my-leader-def 'normal 'override "4" 'winum-select-window-4)
(my-leader-def 'normal 'override "5" 'winum-select-window-5)
(my-leader-def 'normal 'override "6" 'winum-select-window-6)
(my-leader-def 'normal 'override "7" 'winum-select-window-7)
(my-leader-def 'normal 'override "8" 'winum-select-window-8)

(general-define-key "M-x" 'counsel-M-x)
(general-define-key  "s-1" 'winum-select-window-1)
(general-define-key  "s-2" 'winum-select-window-2)
(general-define-key  "s-3" 'winum-select-window-3)
(general-define-key  "s-4" 'winum-select-window-4)
(general-define-key  "s-5" 'winum-select-window-5)

 ;; file frame
(my-leader-def 'normal 'override "f r" 'counsel-recentf)
(my-leader-def 'normal 'override "f n" 'imy/make-frame-by-emacsclient)
(my-leader-def 'normal 'override "f d" 'delete-frame)
(my-leader-def 'normal 'override "f D" 'delete-other-frame)
(my-leader-def 'normal 'override "f m" 'toggle-frame-maximized)

 ;; search
 (my-leader-def 'normal 'override "s s" 'counsel-grep-or-swiper)
 (my-leader-def 'normal 'override "s r" 'counsel-recentf)
 (my-leader-def 'normal 'override "s f" 'counsel-projectile-find-file)
 (my-leader-def 'normal 'override "s D" 'projectile-find-dir)
 (my-leader-def 'normal 'override "s p" 'counsel-projectile-rg)
 (my-leader-def 'normal 'override "s d" 'counsel-rg)
 
 ;; roam
 
 (roam-leader-def 'normal 'override  ";" 'org-roam-find-file)
 (roam-leader-def 'normal 'override  "f" 'evil-repeat-find-char)
 (roam-leader-def 'normal 'override  "l" 'org-roam)
 (roam-leader-def 'normal 'override  "t" 'org-roam-tag-add)
 (roam-leader-def 'normal 'override  "b" 'org-roam-switch-to-buffer)
 (roam-leader-def 'normal 'override  "c" 'org-roam-capture)
 (roam-leader-def 'normal 'override  "a" 'org-roam-alias-add)
 (roam-leader-def 'normal 'override  "g" 'org-roam-graph)
 (roam-leader-def 'normal 'override  "i" 'org-roam-insert)
 (roam-leader-def 'normal 'override  "I" 'org-roam-insert-immediate)
 
 ;; evil
 (general-define-key "C-e" 'move-end-of-line)

 (define-key evil-motion-state-map "L" 'evil-end-of-line)
 (define-key evil-motion-state-map "H" 'evil-first-non-blank)
 (setq evil-motion-state-cursor 'box)  ; █
 (setq evil-visual-state-cursor 'box)  ; █
 (setq evil-normal-state-cursor 'box)  ; █
 (setq evil-insert-state-cursor 'bar)  ; ⎸
 (setq evil-emacs-state-cursor  'hbar) ; _ 
 
 
 ;; org
(my-leader-def 'normal 'override "RET" 'counsel-bookmark)

 (require 'org-bullets)
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) 
 (general-def org-mode-map "M-j" 'org-metadown)
 (general-def org-mode-map "M-k" 'org-metaup)
 (general-def org-mode-map "M-l" 'org-metaright)
 (general-def org-mode-map "M-h" 'org-metaleft) 
 
 ;; ivy
 (setq ivy-re-builders-alist
 '((counsel-rg . ivy--regex-plus)
  (swiper . ivy--regex-plus)
  (swiper-isearch . ivy--regex-plus)
  (t . ivy--regex-ignore-order))) ;; 忽略单词顺序
  
  
 ;; toogle
(my-leader-def 'normal 'override "t z" 'writeroom-mode)
(my-leader-def 'normal 'override "t l" 'org-toggle-link-display)
(my-leader-def 'normal 'override "t y" 'org-yank)
(my-leader-def 'normal 'override "t g" 'grab-mac-link-dwim)
(my-leader-def 'normal 'override "t e" 'eval-region)
(my-leader-def 'normal 'override "t E" 'eval-buffer)
(my-leader-def 'normal 'override "t p" 'imy/org-download-paste-clipboard)
(general-def  "C-; C-i" 'imy/org-download-paste-clipboard) 

 ;; company
(my-leader-def 'normal 'override "t c" 'company-complete) 
 ;; s leader
(s-leader-def 'normal "s" 'avy-goto-char) 
(s-leader-def 'normal "L" 'avy-goto-line) 
(s-leader-def 'normal "j" 'avy-goto-line-below) 
(s-leader-def 'normal "k" 'avy-goto-line-above) 
(s-leader-def 'normal "h" 'avy-org-goto-heading-timer) 
(s-leader-def 'normal "r" 'avy-org-refile-as-child) 

 ;; link hint
 (s-leader-def 'normal "l" 'link-hint-open-link) 
 (s-leader-def 'normal "c" 'link-hint-copy-link) 
 
 ;; evil
 (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
 (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)
 
 ;; projectile
 (projectile-mode +1)
 ;; (general-def 'normal "C-;" 'projectile-command-map) 
 (my-leader-def 'normal "p" 'projectile-command-map) 
 
 ;; magit
 (my-leader-def 'normal 'override "g" 'magit-status)
 
 ;; comment 
 (evilnc-default-hotkeys nil t)
 (g-leader-def 'normal "i" 'evilnc-comment-or-uncomment-lines)
 (g-leader-def 'normal "\\" 'evilnc-comment-operator) 

;; bookmark
(my-leader-def 'normal 'override "m s" 'bookmark-set)
(my-leader-def 'normal 'override "m m" 'list-bookmarks)
(my-leader-def 'normal 'override "m j" 'bookmark-jump)
(my-leader-def 'normal 'override "m S" 'bookmark-save)
;;(my-leader-def 'normal 'override "," 'counsel-bookmark)

;; open
(my-leader-def 'normal 'override "o e" 'imy/eshell-here)
(my-leader-def 'normal 'override "o i" 'imy/open-iTerm)
(my-leader-def 'normal 'override "o o" 'imy/reveal-in-finder)

;; close code 
(my-leader-def 'normal 'override "c e" 'imy/eshell-close)
(my-leader-def 'normal 'override "c h" 'org-hide-block-all)
(my-leader-def 'normal 'override "c s" 'org-show-block-all)
(my-leader-def 'normal 'override "c c" 'org-edit-src-code)
(my-leader-def 'normal 'override "c f" 'org-edit-src-exit)

;; zi
(general-def 'normal  "z i" 'org-toggle-inline-images) 

;;delete
(my-leader-def 'normal 'override "d l" 'imy/org-delete-link)

(provide 'init-map)

