#!/bin/bash

commitmsg="Quick and dirty push"

if [ "$#" -nq 0 ]; then
  echo TEST1: $#
  commitmsg="kokokok"
fi

echo TEST2: $#

git add .
git commit -m "$commitmsg"
git push
