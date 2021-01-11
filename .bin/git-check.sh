#!/bin/bash

# check state of each local repo
# report on uncommitted changes and unpushed commits
for d in `locate --regex "\/code\/[^\/]+\/\.git$"`
do
  #remove '.git'
  d2=${d%.git}
  pushd $d2 > /dev/null

  #find unpushed commits
  git log --branches --not --remotes --oneline --exit-code > /tmp/out
  if [ $? != 0 ]; then
    echo "${d2}  - unpushed change count: `cat /tmp/out | wc -l`"
  fi

  #find uncommitted changes
  lineCount=`git status -s | wc -l`
  if [ $lineCount != 0 ]; then
    echo "${d2}  - uncommitted change count: ${lineCount}"
  fi

  popd > /dev/null
done
