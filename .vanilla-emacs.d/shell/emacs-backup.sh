#!/bin/bash

pushd ~/.emacs.d/

cp ./init.el ~/central-management-system/project/imy-emacs.d/.vanilla-emacs.d/

cp -R ./shell ~/central-management-system/project/imy-emacs.d/.vanilla-emacs.d/
cp -R ./lisp ~/central-management-system/project/imy-emacs.d/.vanilla-emacs.d/
cp -R ./snippets ~/central-management-system/project/imy-emacs.d/.vanilla-emacs.d/

popd

pushd ~/central-management-system/project/imy-emacs.d/

sh ./setup.sh

popd
