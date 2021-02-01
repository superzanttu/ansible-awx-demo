#!/bin/bash

commitmsg="Quick and dirty push"

if [ $# -gt 1 ]; then
  commitmsg="${*:2}"
fi

echo A: $#

git add .
git commit -m "$commitmsg"
git push
