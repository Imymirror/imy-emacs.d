;; init-d.el -*- lexical-binding: t; -*-

;; (require 'init-dump)

(require 'init-imy)
(require 'init-package)
(require 'init-basic)
(require 'init-ivy)
(require 'init-evil)
(require 'init-font)
(require 'init-general) 
(require 'init-map)
(require 'init-roam)

(require 'unicode-fonts)
(unicode-fonts-setup)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(require 'init-evil-surround)
(require 'init-agenda)
(require 'init-journal)			      
(require 'init-capture)
(require 'init-snippet)
(require 'init-paredit)
(require 'init-org-download)
(require 'init-company)

(require 'init-temp)
(require 'init-telega)
(require 'init-which-key)
(require 'init-org-mode)
(require 'init-random-theme)
(require 'init-fold)

(require 'init-treemacs)
(require 'init-elfeed)
(require 'init-nyan-mode)

(require 'init-custom)
