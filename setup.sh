#!/bin/bash

if [ $# -eq 1 ]; then
  mkdir -p $1

  ln -ib -s `pwd`/.bin $1/.bin

  ln -ib -s `pwd`/.bashrc $1/.bashrc

  ln -ib -s `pwd`/.tarsnaprc $1/.tarsnaprc

  ln -ib -s `pwd`/.gitconfig $1/.gitconfig

  mkdir -p $1/.config/
  ln -sn `pwd`/.config/nvim/ $1/.config/
else
  echo "Usage: setup.sh <target dir>"
fi
