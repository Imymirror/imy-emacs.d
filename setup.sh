#!/bin/bash

hugo

git add .
git commit -m "backup"
git push origin main
