#!/bin/bash

emacsclient -e "(kill-emacs)"
emacs --daemon -q -l $IMYMIRROR_INSTALL_DIR/init.el
emacsclient -c -e "(select-frame-set-input-focus (selected-frame))" &


