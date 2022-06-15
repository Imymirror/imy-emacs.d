;;  -*- lexical-binding: t; -*-

(fset 'km-yunwei-add-star
      (kmacro-lambda-form [?i escape ?\C-e ?\C-a ?i ?* ?* ?  down escape] 0 "%d"))

(fset 'km-yunwei-title
      (kmacro-lambda-form [?\C-s ?m ?p ?4 return ?d ?i return escape] 0 "%d"))

(fset 'km-format-problem-name
      (kmacro-lambda-form [?\M-% return ?!] 0 "%d"))

(fset 'km-insert-detailed-timestamp
      (kmacro-lambda-form [?\C-u ?\C-c ?. return] 0 "%d"))

(fset 'km-format-current-buffer
      (kmacro-lambda-form [?\C-x ?h ?\M-x ?i ?n ?d ?e ?x backspace ?n ?t ?- ?r ?e return] 0 "%d"))

(fset 'km-telega-chat-delete
   (kmacro-lambda-form [?\M-x ?t ?e ?l ?e ?g ?a ?- ?c ?h ?a ?t ?- ?d ?e ?l ?e ?t ?e return ?y ?e ?s return ?y ?e ?s return ?i ?\' ?m ?  ?s ?u ?r ?e return] 0 "%d"))

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-keyboard-macro)
