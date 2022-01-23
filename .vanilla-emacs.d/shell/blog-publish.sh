#!/bin/bash

pushd ~/central-management-system/project/blog-yinyang/blog

hugo

sh ./setup.sh

popd
