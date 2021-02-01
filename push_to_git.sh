#!/bin/bash

if [ $# -eq 0 ]; then
  commitmsg="Quick and dirty push"
else
  commitmsg=$#
fi

git add .
git commit -m "$commitmsg"
git push
