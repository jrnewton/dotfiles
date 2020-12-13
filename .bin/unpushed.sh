#!/bin/bash

#WIP - find all unpushed changes in all local repos on all branches
for d in `locate --regex "\/code\/[^\/]+\/\.git$"`
do
  pushd $d > /dev/null
  #git log --branches --not --remotes --no-walk --decorate --oneline
  echo `pwd`
  popd > /dev/null
done
