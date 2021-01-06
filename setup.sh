#!/bin/bash

if [ $# -eq 1 ]; then
  mkdir -p $1

  ln -ib -s `pwd`/.bin $1/.bin

  ln -ib -s `pwd`/.bashrc $1/.bashrc

  ln -ib -s `pwd`/.tarsnaprc $1/.tarsnaprc

  ln -ib -s `pwd`/.gitconfig $1/.gitconfig

  mkdir -p $1/.config/
  ln -sn `pwd`/.config/nvim/ $1/.config/

  ln -sn `pwd`/.config/xfce4/terminal/ $1/.config/xfce4/

  echo "Install these packages"
  cat apps.txt
  echo "  "
  echo "  nvm https://github.com/nvm-sh/nvm"
  echo "  nvim +PlugInstall +qall"
  echo "  sudo update-alternatives --config vim"
  echo "  sudo update-alternatives --config vi"
else
  echo "Usage: setup.sh <target dir>"
  echo ""
  echo "E.g."
  echo "  setup.sh /home/foobar"
fi
