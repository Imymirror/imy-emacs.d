;;  -*- lexical-binding: t; -*-
;; (require 'telega)
(setq telega-use-docker t)
(use-package telega
  :straight
  (:host github :repo "zevlg/telega.el" :branch "master")
  :config
  
  (with-eval-after-load 'telega
    (define-key telega-msg-button-map "k" nil)
    (define-key telega-msg-button-map (kbd "SPC") nil))


  (setq telega-chat-show-avatars t)
  ;; (setq telega-avatar-text-compose-chars nil)
  (setf (alist-get 2 telega-avatar-factors-alist ) '(0.4 . 0.1)) ;; 头像开裂问题
  (setq telega-use-images t)

  (setq telega-proxies
	(list
	 `(:server ,imy/telega-server-ip :port ,imy/telega-server-port :enable t
                   :type (:@type "proxyTypeHttp"
				 :username ,imy/telega-server-username :password ,imy/telega-server-password ))
	 ))
  )


(provide 'init-telega1)
