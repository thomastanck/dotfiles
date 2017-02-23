#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

ln -s "$MY_PATH/git/.gitignore" ~/.gitignore
ln -s "$MY_PATH/git/.gitconfig" ~/.gitconfig
ln -s "$MY_PATH/vim/.vimrc" ~/.vimrc
ln -s "$MY_PATH/vim/.vim/usr" ~/.vim/usr