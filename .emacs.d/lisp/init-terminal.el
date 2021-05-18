(add-to-list 'load-path (concat imy/package-manual-dir "emacs-libvterm"))
(require 'vterm)

(defun my/source-bashrc ()
      (interactive)
      (vterm-send-string "source ~/.bash_profile \n"))

(add-hook 'vterm-mode-hook #'my/source-bashrc)


(provide 'init-terminal)
