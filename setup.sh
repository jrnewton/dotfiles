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

  echo "Software installs"
  echo "  - sudo apt install git git-extras"
  echo "  - sudo apt install neovim && nvim +PlugInstall +qall"
  echo "  - sudo update-alternatives --config vim"
  echo "  - sudo update-alternatives --config vi"
  echo "  - vscode https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
  echo "  - nvm https://github.com/nvm-sh/nvm"
  echo "  - jekyll https://jekyllrb.com/docs/installation/ubuntu/"
  echo "  - docker https://docs.docker.com/engine/install/ubuntu/"
else
  echo "Usage: setup.sh <target dir>"
  echo ""
  echo "E.g."
  echo "  setup.sh /home/foobar"
fi
