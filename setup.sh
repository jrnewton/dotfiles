#!/bin/bash

if [ $# -eq 1 ]; then
  mkdir -p $1

  ln -ib -s `pwd`/.bashrc $1/.bashrc

  ln -ib -s `pwd`/.gitconfig $1/.gitconfig

  mkdir -p $1/.config/
  ln -ib -s `pwd`/.config/nvim $1/.config/nvim
else
  echo "Usage: setup.sh <target dir>"
fi;
