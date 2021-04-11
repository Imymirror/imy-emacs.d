

(add-to-list 'load-path (concat imy/package-manual-dir "telega.el"))

(require 'telega)
(with-eval-after-load 'telega
  (define-key telega-msg-button-map "k" nil)
  )

(setq telega-animation-play-inline nil)

(setq telega-chat-show-avatars nil)
;;(setq telega-avatar-text-compose-chars nil)

(add-hook 'telega-root-mode-hook (lambda () (writeroom-mode nil)))

(setq telega-proxies
      (list
       `(:server ,imy/telega-server-ip :port ,imy/telega-server-port :enable t
                 :type (:@type "proxyTypeHttp"
                               :username ,imy/telega-server-username :password ,imy/telega-server-password ))
       ))


(defun my-telega-chat-mode ()
  (set (make-local-variable 'company-backends)
       (append (list telega-emoji-company-backend
                   'telega-company-username
                   'telega-company-hashtag)
             (when (telega-chat-bot-p telega-chatbuf--chat)
               '(telega-company-botcmd))))
  (company-mode 1)
  (writeroom-mode 1))

(add-hook 'telega-chat-mode-hook 'my-telega-chat-mode)


(set-fontset-font t 'unicode "Symbola" nil 'append)

(setq telega-symbol-unread "🄌")
;; (setq telega-symbol-reply "↫")                                        

(defun my-telega-load ()
  ;; 🄌 occupies two full chars, but (string-width "🄌") returns 1
  ;; so we install custom widths to `char-width-table'
  (telega-symbol-set-width telega-symbol-unread 2)

  ;; ... other code
  )

(add-hook 'telega-load-hook 'my-telega-load)

(provide 'init-telega)
