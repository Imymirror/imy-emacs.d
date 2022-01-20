;;  -*- lexical-binding: t; -*-

;;(setq coding-system-for-read 'utf-8)


(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(require 'init-speedup)
(require 'init-some-path)
(require 'init-imi-func)
(require 'init-font)
(require 'init-basic)
(require 'init-project)
(require 'init-platform)
(require 'init-straight)

(require 'init-gtd)			        

;; package
(require 'init-meow)			        
(require 'init-roam)
(require 'init-org-mode)		        
(require 'init-org-download)
(require 'init-citar)
(require 'init-pomodoro)
(require 'init-mind-map)

;; ;; completion system			        
(require 'init-vertico)
(require 'init-consult)		        
(require 'init-rg)

;; ;; language				        
(require 'init-lsp)			        
(require 'init-tree-sitter)		        
					        
(require 'init-mode-enable)

(with-eval-after-load 'ox
  (require 'ox-hugo))

(require 'init-custom)		        
