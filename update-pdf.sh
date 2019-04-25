#!/bin/bash

set -x

git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch bamos_thesis.pdf' \
  --prune-empty --tag-name-filter cat -- --all
make
git add -f bamos_thesis.pdf
git commit -m 'Update PDF.'
git push -f
