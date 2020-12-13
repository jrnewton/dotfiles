#!/bin/bash

#WIP - find all unpushed changes in all local repos on all branches
locate --regex "\/code\/[^\/]+\/\.git$"
git log --branches --not --remotes --no-walk --decorate --oneline
