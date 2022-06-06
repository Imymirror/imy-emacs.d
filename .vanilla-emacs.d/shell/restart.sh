#!/bin/bash

emacsclient -e "(kill-emacs)"
emacs --daemon
emacsclient -c -e "(select-frame-set-input-focus (selected-frame))" &


