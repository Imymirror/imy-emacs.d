;;  -*- lexical-binding: t; -*-

(fset 'km-yunwei-add-star
   (kmacro-lambda-form [?i escape ?\C-e ?\C-a ?i ?* ?* ?  down escape] 0 "%d"))

(fset 'km-yunwei-title
      (kmacro-lambda-form [?\C-s ?m ?p ?4 return ?d ?i return escape] 0 "%d"))


(provide 'init-keyboard-macro)
