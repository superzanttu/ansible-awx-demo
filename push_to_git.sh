#!/bin/bash

commitmsg="Quick and dirty push"

if [ $# -qt 1 ]; then
  echo TEST1: $#
  commitmsg="kokokok"
fi

echo TEST2: $#

git add .
git commit -m "$commitmsg"
git push
