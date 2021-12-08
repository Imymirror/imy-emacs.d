
emacsclient -e "(kill-emacs)"
emacs --daemon -q -l ~/project/vanilla-emacs/init.el
emacsclient -c  &
# emacsclient -c "(select-frame-set-input-focus (selected-frame))" &
