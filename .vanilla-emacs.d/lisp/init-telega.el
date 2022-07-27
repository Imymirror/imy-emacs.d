
(use-package telega
  :straight
  (:host github :repo "zevlg/telega.el" :branch "release-0.8.0")
  :bind (("C-M-s-)"  . telega) )
  :config
  ;;  (setq telega-use-docker t)

  (add-hook 'telega-msg-ignore-predicates 'telega-msg-from-blocked-sender-p)

  (define-key telega-msg-button-map "k" nil)
  (define-key telega-msg-button-map (kbd "SPC") nil)

  (global-set-key (kbd "C-M-s-)") 'telega)

  (setq telega-chat-show-avatars t)
  (setq telega-use-images t)

  (setq telega-avatar-text-compose-chars nil)
;;   (setf (alist-get 2 telega-avatar-factors-alist ) '(0.5 . 0.1)) ;; 头像开裂问题
  (defun telega-buffer-face-mode-variable ()
    (interactive)
    (make-face 'my-telega-face)
    ;; (set-face-attribute 'my-telega-face nil :font "M+ 1m")
    (set-face-attribute 'my-telega-face nil :font "Sarasa Mono SC Nerd 13")
;;    (set-face-attribute 'my-telega-face nil :font "Fira Code 12")

    (setq buffer-face-mode-face 'my-telega-face)
    (buffer-face-mode))

  (add-hook 'telega-root-mode-hook 'telega-buffer-face-mode-variable)
  (add-hook 'telega-webpage-mode-hook 'telega-buffer-face-mode-variable)
  (add-hook 'telega-chat-mode-hook 'telega-buffer-face-mode-variable)


  (setq telega-proxies
	(list
	 `(:server ,imy/telega-server-ip :port ,imy/telega-server-port :enable t
                   :type (:@type "proxyTypeHttp"
				 ;:username ,imy/telega-server-username :password ,imy/telega-server-password
				 ))
	 ))
  )

(provide 'init-telega)
