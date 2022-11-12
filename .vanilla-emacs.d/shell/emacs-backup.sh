#!/bin/bash

export IMYMIRROR_INSTALL_DIR="$EMACSCFG_DIR/.emacs.d"

pushd $IMYMIRROR_INSTALL_DIR

IMY_EMACS_DIR=~/imymirror/project/imy-emacs.d
VANILLA_DIR=$IMY_EMACS_DIR/.vanilla-emacs.d

cp ./init.el $VANILLA_DIR

cp -R ./shell $VANILLA_DIR 
cp -R ./lisp $VANILLA_DIR
cp -R ./snippets $VANILLA_DIR

cp -R ./site-lisp $VANILLA_DIR

popd

pushd $IMY_EMACS_DIR 

sh ./setup.sh

popd
