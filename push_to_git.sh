#!/bin/bash

commitmsg="Quick and dirty push"

if [ $# -qt 1 ]; then
  commitmsg="kokokok"
fi

echo TEST: $#

git add .
git commit -m "$commitmsg"
git push
