#!/bin/bash

#find all unpushed changes in all local repos on all branches
for d in `locate --regex "\/code\/[^\/]+\/\.git$"`
do
  #remove '.git'
  d2=${d%.git}
  pushd $d2 > /dev/null
  git log --branches --not --remotes --oneline --exit-code > /tmp/out
  if [ $? != 0 ]; then
    echo "${d2}  - unpushed change count: `cat /tmp/out | wc -l`"
  fi
  popd > /dev/null
done
