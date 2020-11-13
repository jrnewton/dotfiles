#!/bin/bash
# show diff of incoming pull from origin
git log -p --abbrev-commit ..origin/`git-head-branch.sh`
