#!/bin/bash

commitmsg="Quick and dirty push!"

if [ ! $# -eq 0 ]; then
  echo TEST1: $#
  commitmsg="$."
fi

echo TEST2: $#

git add .
git commit -m "$commitmsg"
git push
