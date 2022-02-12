;;  -*- lexical-binding: t; -*-

;; blog 相关 export,preview,publish
(require 'init-blog)
(require 'init-mind-map)

;; 自动备份 emacs 配置
(defun imi/backup-emacs ()
  "backup emacs configuration to github"
  (interactive)
  (start-process "my-process" "automation" "sh" "/Users/fuhongxue/.emacs.d/shell/emacs-backup.sh" "/bin"))

(defun imi/backup-zotero ()
  "backup emacs configuration, Programming-source-code-analysis to github"
  (interactive)
  (start-process "my-process" "automation" "sh" "/Users/fuhongxue/.emacs.d/shell/zotero-backup.sh" "/bin"))

(provide 'init-automation)
