;; init-map.el -*- lexical-binding: t; -*-

;; (with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-normal-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map  (kbd "C-v") nil) ;; evil-visual-block
  (define-key evil-motion-state-map  (kbd "SPC") nil) ;; evil-visual-block
  (define-key evil-motion-state-map  (kbd ";") nil) ;;'evil-repeat-find-char)
  (define-key evil-motion-state-map  (kbd "C-e") nil)
  (define-key evil-motion-state-map  (kbd "TAB") nil)
  (define-key evil-normal-state-map  (kbd "s") nil) ;; evil-substitute
  ;; )

(evil-define-key 'treemacs treemacs-mode-map (kbd "SPC")  nil)
(evil-define-key 'visual global-map (kbd ">") 'imy/evil-shift-right)
(evil-define-key 'visual global-map (kbd "<") 'imy/evil-shift-left)

(general-define-key "C-; C-d" 'ivy-immediate-done)

(general-create-definer spc-leader-def :prefix "SPC")
(general-create-definer roam-leader-def :prefix ";")
(general-create-definer s-leader-def :prefix "s")
(general-create-definer g-leader-def :prefix "g")
(spc-leader-def 'normal 'override "SPC" 'counsel-M-x)
(spc-leader-def 'normal 'override "`" 'repeat)
(general-define-key "M-x" 'counsel-M-x)
(general-define-key "s-f" 'swiper-isearch)


(with-eval-after-load 'counsel
  (define-key counsel-find-file-map  (kbd "TAB") #'ivy-alt-done))

(general-define-key "C-x C-f" 'counsel-find-file) 

(spc-leader-def 'normal 'override "." 'counsel-find-file)
(spc-leader-def 'normal 'override "'" 'ivy-resume)
(spc-leader-def  'normal ";" 'evil-repeat-find-char) 

;; general
(general-def 'insert  "C-v" 'org-yank) 
(general-def  'normal "C-v" 'org-yank) 
(general-define-key "s-c" 'evil-yank)
(general-define-key "s-v" 'org-yank)

;; yas
(general-def 'insert  "C-'" 'yas-expand) 
(general-def  'normal "C-'" 'yas-expand) 

;;telega
(general-define-key "C-M-s-)" 'telega) 

;; macos
 (setq mac-option-key-is-meta t
       x-select-enable-clipboard 't
       ;; mac-command-key-is-meta nil
       mac-command-modifier 'super
       mac-option-modifier 'meta)

;; help
 (spc-leader-def 'normal 'override "h t" 'counsel-load-theme)
 (spc-leader-def 'normal 'override "h v" 'counsel-describe-variable)
 (spc-leader-def 'normal 'override "h k" 'describe-key)
 (spc-leader-def 'normal 'override "h f" 'counsel-describe-function)
 
 ;; buffer

(spc-leader-def 'normal 'override "x" 'imy/create-1/3-scratch-buffer)
(spc-leader-def 'normal 'override "b b" 'counsel-switch-buffer)
(spc-leader-def 'normal 'override "b s" 'save-buffer)
(spc-leader-def 'normal 'override "b S" 'evil-write-all)
(spc-leader-def 'normal 'override "b k" 'kill-current-buffer)
(spc-leader-def 'normal 'override "b d" 'kill-current-buffer)
(spc-leader-def 'normal 'override "b p" 'previous-buffer)
(spc-leader-def 'normal 'override "b n" 'next-buffer)
(spc-leader-def 'normal 'override "b i" 'ibuffer)
 
 ;; window
 (spc-leader-def 'normal 'override "w w" 'other-window)
 (spc-leader-def 'normal 'override "w d" 'delete-window)
 (spc-leader-def 'normal 'override "w m" 'delete-other-windows)
 (spc-leader-def 'normal 'override "w D" 'delete-other-windows)
 (spc-leader-def 'normal 'override "w b" '(lambda () (interactive) (split-window-vertically) (other-window 1)))
 (spc-leader-def 'normal 'override "w r" '(lambda () (interactive) (split-window-horizontally) (other-window 1)))
 (spc-leader-def 'normal 'override "w <" 'scroll-left)
 (spc-leader-def 'normal 'override "w >" 'scroll-right)
 (spc-leader-def 'normal 'override "w }" 'enlarge-window-horizontally)
 (spc-leader-def 'normal 'override "w {" 'shrink-window-horizontally)
 (spc-leader-def 'normal 'override "w H" 'evil-window-move-far-left)
 (spc-leader-def 'normal 'override "w L" 'evil-window-move-far-right)
 (spc-leader-def 'normal 'override "w J" 'evil-window-move-very-bottom)
 (spc-leader-def 'normal 'override "w K" 'evil-window-move-very-top)
 (spc-leader-def 'normal 'override "w h" 'evil-window-left)
 (spc-leader-def 'normal 'override "w l" 'evil-window-right)
 (spc-leader-def 'normal 'override "w j" 'evil-window-down)
 (spc-leader-def 'normal 'override "w k" 'evil-window-up)
 (spc-leader-def 'normal 'override "w a" 'winner-undo)
 (spc-leader-def 'normal 'override "w f" 'winner-redo)

(spc-leader-def 'normal 'override "1" 'winum-select-window-1)
(spc-leader-def 'normal 'override "2" 'winum-select-window-2)
(spc-leader-def 'normal 'override "3" 'winum-select-window-3)
(spc-leader-def 'normal 'override "4" 'winum-select-window-4)
(spc-leader-def 'normal 'override "5" 'winum-select-window-5)
(spc-leader-def 'normal 'override "6" 'winum-select-window-6)
(spc-leader-def 'normal 'override "7" 'winum-select-window-7)
(spc-leader-def 'normal 'override "8" 'winum-select-window-8)

(general-define-key "M-x" 'counsel-M-x)
(general-define-key  "s-1" 'winum-select-window-1)
(general-define-key  "s-2" 'winum-select-window-2)
(general-define-key  "s-3" 'winum-select-window-3)
(general-define-key  "s-4" 'winum-select-window-4)
(general-define-key  "s-5" 'winum-select-window-5)

 ;; file frame
(spc-leader-def 'normal 'override "f r" 'counsel-recentf)
(spc-leader-def 'normal 'override "f n" 'imy/make-frame-by-emacsclient)
(spc-leader-def 'normal 'override "f d" 'delete-frame)
(spc-leader-def 'normal 'override "f D" 'delete-other-frame)
(spc-leader-def 'normal 'override "f m" 'toggle-frame-maximized)

 ;; search
 (spc-leader-def 'normal 'override "s s" 'swiper-isearch)
 (spc-leader-def 'normal 'override "s i" 'counsel-imenu)
 (spc-leader-def 'normal 'override "s r" 'counsel-recentf)
 (spc-leader-def 'normal 'override "s f" 'counsel-projectile-find-file)
 (spc-leader-def 'normal 'override "s D" 'projectile-find-dir)
 (spc-leader-def 'normal 'override "s p" 'counsel-projectile-rg)
 (general-define-key "s-F" 'counsel-projectile-rg)
 (spc-leader-def 'normal 'override "s d" 'counsel-rg)
 (spc-leader-def 'normal 'override "s l" 'imy/find-emacs-lisp-find)
 (spc-leader-def 'normal 'override "s a" 'imy/find-agenda-find)
 
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
(spc-leader-def 'normal 'override "RET" 'counsel-bookmark)

(general-def org-mode-map "M-j" 'org-metadown)
(general-def org-mode-map "M-k" 'org-metaup)
(general-def org-mode-map "M-l" 'org-metaright)
(general-def org-mode-map "M-h" 'org-metaleft) 

 ;; toogle
(spc-leader-def 'normal 'override "t t" 'treemacs)
(spc-leader-def 'normal 'override "t h" 'link-hint-open-link)
(spc-leader-def 'normal 'override "t a" 'org-agenda)
(spc-leader-def 'normal 'override "t z" 'writeroom-mode)
(spc-leader-def 'normal 'override "t l" 'org-toggle-link-display)
(spc-leader-def 'normal 'override "t y" 'org-yank)
(spc-leader-def 'normal 'override "t g" 'grab-mac-link-dwim)
(spc-leader-def 'normal 'override "t c" 'org-capture)
(spc-leader-def 'normal 'override "t f" 'elfeed)
(general-def  "C-; C-g" 'grab-mac-link-dwim) 
(general-def  "C-; C-t" 'rand-theme) 

(spc-leader-def 'normal 'override "t e" 'eval-region)
(spc-leader-def 'normal 'override "t E" 'eval-buffer)
(spc-leader-def 'normal 'override "t p" 'imy/org-download-paste-clipboard)
(general-def  "C-; C-i" 'imy/org-download-paste-clipboard) 

;; company
;; (global-set-key (kbd "C-m") 'company-complete)

 ;; s leader
(s-leader-def 'normal "s" 'avy-goto-char) 
(s-leader-def 'normal "L" 'avy-goto-line) 
(s-leader-def 'normal "j" 'avy-goto-line-below) 
(s-leader-def 'normal "k" 'avy-goto-line-above) 
(s-leader-def 'normal "h" 'avy-org-goto-heading-timer) 
(s-leader-def 'normal "r" 'avy-org-refile-as-child) 
(s-leader-def 'normal "f" 'swiper-thing-at-point) 
(s-leader-def 'normal ";" 'avy-goto-char-timer) 
(s-leader-def 'normal "n" 'imy/avy-goto-char-near-point) 

 ;; link hint
 (s-leader-def 'normal "l" 'link-hint-open-link) 
 (s-leader-def 'normal "c" 'link-hint-copy-link) 
 
 ;; evil
 (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
 (define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)
 
 ;; projectile
 (projectile-mode +1)
 ;; (general-def 'normal "C-;" 'projectile-command-map) 
 (spc-leader-def 'normal "p" 'projectile-command-map) 
 
 ;; magit
 (spc-leader-def 'normal 'override "g" 'magit-status)
 
 ;; comment 
 (evilnc-default-hotkeys nil t)
 (g-leader-def 'normal "i" 'evilnc-comment-or-uncomment-lines)
 (g-leader-def 'normal "\\" 'evilnc-comment-operator) 

;; bookmark
(spc-leader-def 'normal 'override "m s" 'bookmark-set)
(spc-leader-def 'normal 'override "m m" 'list-bookmarks)
(spc-leader-def 'normal 'override "m j" 'bookmark-jump)
(spc-leader-def 'normal 'override "m S" 'bookmark-save)
;;(spc-leader-def 'normal 'override "," 'counsel-bookmark)

;; open org
;; (spc-leader-def 'normal 'override "o e" 'imy/eshell-here)
(spc-leader-def 'normal 'override "o v" 'imy/open-vterm)
(spc-leader-def 'normal 'override "o i" 'imy/open-iTerm)
(spc-leader-def 'normal 'override "o o" 'imy/reveal-in-finder)
(spc-leader-def 'normal 'override "o ;" 'imy/org-show-current-heading-tidily)
(spc-leader-def 'normal 'override "o k" 'imy/org-show-previous-heading-tidily)
(spc-leader-def 'normal 'override "o j" 'imy/org-show-next-heading-tidily)
(spc-leader-def 'normal 'override "o f" 'imy/org-foldup)
(spc-leader-def 'normal 'override "o F" 'org-footnote-new)
(general-def "C-; C-f" 'org-footnote-new) 
(spc-leader-def 'normal 'override "o y" 'yas-insert-snippet)

;; close code 
(spc-leader-def 'normal 'override "c e" 'imy/eshell-close)
(spc-leader-def 'normal 'override "c h" 'org-hide-block-all)
(spc-leader-def 'normal 'override "c s" 'org-show-block-all)
(spc-leader-def 'normal 'override "c c" 'org-edit-src-code)
(spc-leader-def 'normal 'override "c f" 'org-edit-src-exit)

;; zi
(general-def 'normal  "z i" 'org-toggle-inline-images) 

;;delete
(spc-leader-def 'normal 'override "d l" 'imy/org-delete-link)

(provide 'init-map)
