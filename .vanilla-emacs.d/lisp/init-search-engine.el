;;  -*- lexical-binding: t; -*-

(defun prelude-search (query-url prompt)
  "Open the search url constructed with the QUERY-URL.
PROMPT sets the `read-string prompt."
  (browse-url
   (concat query-url
           (url-hexify-string
            (if mark-active
                (buffer-substring (region-beginning) (region-end))
              (read-string prompt))))))


(defmacro prelude-install-search-engine (search-engine-name search-engine-url search-engine-prompt)
  "Given some information regarding a search engine, install the interactive command to search through them"
  `(defun ,(intern (format "imi/search-%s" search-engine-name)) ()
       ,(format "Search %s with a query or region if any." search-engine-name)
       (interactive)
       (prelude-search ,search-engine-url ,search-engine-prompt)))

(prelude-install-search-engine "google"     "http://www.google.com/search?q="              "Google: ")
(prelude-install-search-engine "youtube"    "http://www.youtube.com/results?search_query=" "Search YouTube: ")
(prelude-install-search-engine "github"     "https://github.com/search?q="                 "Search GitHub: ")
(prelude-install-search-engine "duckduckgo" "https://duckduckgo.com/?t=lm&q="              "Search DuckDuckGo: ")
(prelude-install-search-engine "deepl" "https://www.deepl.com/translator#zh/en/"              "Search Deepl: ")
(prelude-install-search-engine "google-translator" "https://translate.google.com.hk/?hl=en&sl=zh-CN&tl=en&&text="              "Search Google Translate: ")

(global-set-key (kbd "C-c C-/ g") 'imi/search-google)
(global-set-key (kbd "C-c C-/ h") 'imi/search-github)
(global-set-key (kbd "C-c C-/ y") 'imi/search-youtube)
(global-set-key (kbd "C-c C-/ D") 'imi/search-duckduckgo)
(global-set-key (kbd "C-c C-/ d") 'imi/search-deepl)
(global-set-key (kbd "C-c C-/ G") 'imi/google-traslator)

(provide 'init-search-engine)
