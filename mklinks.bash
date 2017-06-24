#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
	# error; for some reason, the path is not accessible
	# to the script (e.g. permissions re-evaled after suid)
	exit 1  # fail
fi

# Git
ln -sfn "$MY_PATH/git/gitignore" ~/.gitignore
ln -sfn "$MY_PATH/git/gitconfig" ~/.gitconfig

# Vim
mkdir -p ~/.vim
ln -sfn "$MY_PATH/vim/vimrc" ~/.vimrc
ln -sfn "$MY_PATH/vim/usr" ~/.vim/usr

# Shell
[ -h ~/.bashrc ] || mv ~/.bashrc ~/.bashrc-old
[ -h ~/.profile ] || mv ~/.profile ~/.profile-old
ln -sfn "$MY_PATH/sh/bashrc" ~/.bashrc
ln -sfn "$MY_PATH/sh/profile" ~/.profile
