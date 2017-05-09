#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
	# error; for some reason, the path is not accessible
	# to the script (e.g. permissions re-evaled after suid)
	exit 1  # fail
fi

# Git
[ -h ~/.gitignore ] || ln -s "$MY_PATH/git/.gitignore" ~/.gitignore
[ -h ~/.gitconfig ] || ln -s "$MY_PATH/git/.gitconfig" ~/.gitconfig

# Vim
mkdir -p ~/.vim
[ -h ~/.vimrc ] || ln -s "$MY_PATH/vim/.vimrc" ~/.vimrc
[ -h ~/.vim/usr ] || ln -s "$MY_PATH/vim/.vim/usr" ~/.vim/usr

# Shell
[ -h ~/.bashrc ] || mv ~/.bashrc ~/.bashrc-old
[ -h ~/.profile ] || mv ~/.profile ~/.profile-old
[ -h ~/.bashrc ] || ln -s "$MY_PATH/.bashrc" ~/.bashrc
[ -h ~/.profile ] || ln -s "$MY_PATH/.profile" ~/.profile
