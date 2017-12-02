#!/bin/sh

# Check for current dotfiles in $HOME

FILES="zshrc vimrc tmux.conf"
#files="test1 test2 test3"
SUFFIX=".bkup"
BASEDIR=$(pwd)

for FILE in $FILES
do	
	if [ -f $HOME/.$FILE ]
	then
		echo "Found $HOME/.$FILE -> Moving to $HOME/.$FILE$SUFFIX"
		mv $HOME/.$FILE $HOME/.$FILE$SUFFIX
	fi
	echo "Creating symbolic link from $HOME/.$FILE to $BASEDIR/$FILE"
	ln -s $BASEDIR/$FILE $HOME/.$FILE
done
