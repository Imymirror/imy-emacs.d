;; init-pinyin.el -*- lexical-binding: t; -*-

;; 此插件目的是让 ivy 支持拼音, 但是解决得并不完美 
;; avy support pinyin
(require 'ace-pinyin)

;; ivy support pinyin 
(require 'pinyinlib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; let `ivy-read' support chinese pinyin
(require 'pinyinlib)

(defun re-builder-pinyin (str)
  (or (pinyin-to-utf8 str)
       ;; (ivy--regex-plus str)
       (ivy--regex-ignore-order str) 
  )
)



(setq ivy-re-builders-alist
      '(
        (t . re-builder-pinyin)
        ))

 ;; (setq ivy-re-builders-alist
 ;;       '(
 ;; 	 (counsel-rg . ivy--regex-plus)
 ;; 	 (swiper . ivy--regex-plus)
 ;; 	 (swiper-isearch . ivy--regex-plus)
 ;;         (t . re-builder-pinyin)
 ;;  ;; (t . ivy--regex-ignore-order)
 ;;  )) 

(defun my-pinyinlib-build-regexp-string (str)
  (progn
    (cond ((equal str ".*")
           ".*")
          (t
           (pinyinlib-build-regexp-string str t))))
  )
(defun my-pinyin-regexp-helper (str)
  (cond ((equal str " ")
         ".*")
        ((equal str "")
         nil)
        (t
         str)))

(defun pinyin-to-utf8 (str)
  (cond ((equal 0 (length str))
         nil)
        ((equal (substring str 0 1) "!")
         (mapconcat 'my-pinyinlib-build-regexp-string
                    (remove nil (mapcar 'my-pinyin-regexp-helper (split-string
                                                                  (replace-regexp-in-string "!" "" str) "")))
                    ""))
        nil))


;; ;; ;;; this function can remove `pinyin' match
;; (defun pinyin-to-utf8 (str)
;;   nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-pinyin)
