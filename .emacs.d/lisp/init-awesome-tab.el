;; init-awesome-tab.el -*- lexical-binding: t; -*-
(add-to-list 'load-path (concat imy/package-manual-dir "awesome-tab"))

(require 'awesome-tab)

;; (awesome-tab-mode t)

(defhydra awesome-fast-switch (:hint nil)
  "
 ^^^^Fast Move             ^^^^Tab                    ^^Search            ^^Misc
-^^^^--------------------+-^^^^---------------------+-^^----------------+-^^---------------------------
   ^_k_^   prev group    | _C-a_^^     select first | _b_ search buffer | _C-k_   kill buffer
 _h_   _l_  switch tab   | _C-e_^^     select last  | _g_ search group  | _C-S-k_ kill others in group
   ^_j_^   next group    | _C-j_^^     ace jump     | ^^                | ^^
 ^^0 ~ 9^^ select window | _C-h_/_C-l_ move current | ^^                | ^^
-^^^^--------------------+-^^^^---------------------+-^^----------------+-^^---------------------------
"
  ("h" awesome-tab-backward-tab)
  ("j" awesome-tab-forward-group)
  ("k" awesome-tab-backward-group)
  ("l" awesome-tab-forward-tab)
  ("C-a" awesome-tab-select-beg-tab)
  ("C-e" awesome-tab-select-end-tab)
  ("C-j" awesome-tab-ace-jump)
  ("C-h" awesome-tab-move-current-tab-to-left)
  ("C-l" awesome-tab-move-current-tab-to-right)
  ("b" ivy-switch-buffer)
  ("g" awesome-tab-counsel-switch-group)
  ("C-k" kill-current-buffer)
  ("C-S-k" awesome-tab-kill-other-buffers-in-current-group)
  ("q" nil "quit"))

(spc-leader-def 'normal 'override "a h" 'awesome-fast-switch/body)

(global-set-key (kbd "M-1") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-2") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-3") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-4") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-5") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-6") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-7") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-8") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-9") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "M-0") 'awesome-tab-select-visible-tab)

(provide 'init-awesome-tab)
