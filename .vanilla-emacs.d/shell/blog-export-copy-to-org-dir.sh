#!/bin/bash

# 清空 content 和 static 文件夹
rm -rf ~/central-management-system/zotero/roam/blog/content/*
rm -rf ~/central-management-system/zotero/roam/blog/static/*

# 将 github blog 的content 和 static 拷贝到 export blog 相应的目录下
cp -R ~/central-management-system/project/blog-yinyang/blog/static/* ~/central-management-system/zotero/roam/blog/static/ 
cp -R ~/central-management-system/project/blog-yinyang/blog/content/cn/posts/* ~/central-management-system/zotero/roam/blog/content/ 

# cp -R ~/central-management-system/zotero/roam/blog/content ~/central-management-system/zotero/roam/blog/testc
