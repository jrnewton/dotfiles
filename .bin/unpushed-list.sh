#!/bin/bash

#find all unpushed changes in all local repos on all branches
for d in `locate --regex "\/code\/[^\/]+\/\.git$"`
do
  #remove '.git'
  d2=${d%.git}
  pushd $d2 > /dev/null
  git log --branches --not --remotes --no-walk --oneline --exit-code > /dev/null
  if [ $? != 0 ]; then
    echo $d2
  fi
  popd > /dev/null
done
