#!/bin/bash

pushd ~/central-management-system/0-shape-up-method/assets/

sh auto-update.sh

popd

pushd ~/central-management-system/project/Programming-source-code-analysis/

sh run.sh

popd
