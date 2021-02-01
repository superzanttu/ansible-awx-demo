#!/bin/bash

commitmsg="Quick and dirty push"

if [ $# -nq 0 ]; then
  commitmsg="${*:2}"
fi

echo $#

git add .
git commit -m "$commitmsg"
git push
