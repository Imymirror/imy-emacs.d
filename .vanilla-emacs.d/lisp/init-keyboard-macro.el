;;  -*- lexical-binding: t; -*-

(fset 'km-yunwei-add-star
   (kmacro-lambda-form [?i escape ?\C-e ?\C-a ?i ?* ?* ?  down escape] 0 "%d"))

(fset 'km-yunwei-title
      (kmacro-lambda-form [?\C-s ?m ?p ?4 return ?d ?i return escape] 0 "%d"))

(fset 'km-format-problem-name
   (kmacro-lambda-form [?\M-% return ?!] 0 "%d"))

(fset 'km-format-current-buffer
   (kmacro-lambda-form [?\C-x ?h ? ?¾] 0 "%d"))

(fset 'km-insert-detailed-timestamp
   (kmacro-lambda-form [?\C-u ?\C-c ?. return] 0 "%d"))

(provide 'init-keyboard-macro)
