#!/bin/sh

# Check for current dotfiles in $HOME

#files="$HOME/.zshrc $HOME/.vimrc $HOME/.tmux.conf"
files="test1 test2 test3"
suffix=".bkup"


for file in $files
do	
	if [ -f $HOME/.$file ]
	then
		echo $file
		#mv $file $file$suffix
		
	fi
done
