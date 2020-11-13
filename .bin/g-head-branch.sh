#!/bin/bash
# print out the HEAD branch.  Sometimes master, hopefully main. 
# second cut is to remove leading space after ':'
git remote show origin | grep "HEAD branch" | cut -d ":" -f 2 | cut -d " " -f 2
