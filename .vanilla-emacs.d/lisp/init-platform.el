;;; -*- lexical-binding: t -*-

;; macos
(setq mac-option-key-is-meta t
       x-select-enable-clipboard 't
       ;; mac-command-key-is-meta nil
       mac-command-modifier 'super
       mac-option-modifier 'meta)


;; emacs-plus
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))    
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

(provide 'init-platform)
