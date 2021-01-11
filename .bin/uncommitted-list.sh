#!/bin/bash

#find all uncommitted changes in all local repos on all branches
for d in `locate --regex "\/code\/[^\/]+\/\.git$"`
do
  #remove '.git'
  d2=${d%.git}
  pushd $d2 > /dev/null
  lineCount=`git status -s | wc -l`
  if [ $lineCount != 0 ]; then
    echo "${d2}  - uncommitted change count: ${lineCount}"
  fi
  popd > /dev/null
done
