#!/bin/bash

# rm manifest
# touch manifest
# gh repo list zowe --limit 150 --source --visibility public | cut -f1 | tee -a manifest

cat manifest | while read -r repo; do
  # echo "gh repo clone $repo"
  gh repo clone "$repo"
done
