#!/bin/bash

emacsclient -e "(kill-emacs)"
# emacs --daemon -q -l $IMYMIRROR_INSTALL_DIR/init.el
emacs --daemon --init-directory $IMYMIRROR_INSTALL_DIR
emacsclient -c -e "(select-frame-set-input-focus (selected-frame))" &


