# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=10000
SAVEHIST=10000

export JAVA_HOME=/usr/lib/jvm/java-6-sun
export PATH=/home/stephen/bin:/usr/local/apache-maven-2.2.1/bin:$PATH
export CATALINA_HOME=/usr/share/tomcat6
export CLASSPATH=/usr/share/maven-repo/

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "^R" history-incremental-search-backward
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
#bindkey "\e[5~" beginning-of-buffer-or-history

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/stephen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


if [[ "$TERM" == "xterm" ]]; then
	export TERM=xterm-256color
fi

function precmd() {

		if [[ -w $PWD ]]; then
			PR_PWDCOLOR=$'%{\e[32m%}'
		else
				PR_PWDCOLOR=$'%{\e[31m%}'
		fi

}

setprompt() {
	setopt prompt_subst

	autoload colors zsh/terminfo

	if [[ "$terminfo[colors]" -ge 256 ]]; then
		autoload -U colors && colors
	
for COLOR in RED GREEN YELLOW WHITE BLACK BLUE CYAN GRAY; do
	eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
	eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

PR_RESET="%{$reset_color%}"

PR_PWD_DEFAULT=$'%{\e[38;5;78m%}'
PR_PWD_YELLOW=$'%{\e[38;5;226m%}'

#PROMPT=$'${DRKBLUE}..${MIDBLUE}:${LITBLUE}(%T %W)${MIDBLUE}:${DRKBLUE}....${MIDBLUE}:${LITBLUE}(${PR_PWDCOLOR}%~${LITBLUE})${MIDBLUE}:${DRKBLUE}..
#..${MIDBLUE}:${LITBLUE}(%n${PR_BRIGHT_WHITE}@${LITBLUE}%m)${MIDBLUE}:${DRKBLUE}.. %{\e[0m%}'

#PROMPT=$'%{\e[34m%}..%{\e[1;34m%}:%{\e[1;36m%}(%T %W)%{\e[1;34m%}:%{\e[34m%}....%{\e[1;34m%}:%{\e[1;36m%}(${PR_PWDCOLOR}%~%{\e[1;36m%})%{\e[1;34m%}:%{\e[34m%}..
#..%{\e[1;34m%}:%{\e[1;36m%}(%n${PR_BRIGHT_WHITE}@%{\e[1;36m%}%m)%{\e[1;34m%}:%{\e[34m%}.. %{\e[0m%}'

#PROMPT=$'┌─[\u@\h \W]\[\e[0;32m\][${cwd}\t]\[\033[0m\] ${fill}\n\[\033[0m\]└─■ '

PROMPT=$'${PR_WHITE}%n ${PR_BLUE}(${PR_PWDCOLOR}%~${PR_BLUE})
${PR_BRIGHT_BLACK}>${PR_RESET}${PR_BLUE}>${PR_BRIGHT_BLUE}>${PR_RESET} '

	alias ls="ls --color"
	alias lsl="ls -lh --color"
	alias lsa="ls -alh --color"

	d=.dircolors
	test -r $d && eval "$(dircolors $d)"

	else

PROMPT=$'${PR_WHITE}%n ${PR_BLUE}(${PR_GREEN}%~${PR_BLUE})
${PR_BRIGHT_BLACK}>${PR_BLUE}>${PR_BRIGHT_BLUE}>%{$reset_color%} '

#	PROMPT=$'${PR_BRIGHT_BLACK}.${PR_RESET}${PR_BLUE}:${PR_BRIGHT_BLUE}(%T %W)${PR_RESET}${PR_BLUE}:${PR_BRIGHT_BLACK}.........${PR_BRIGHT_BLACK}
#.${PR_RESET}${PR_BLUE}.${PR_BRIGHT_BLUE}:(%m${PR_RESET}${PR_BRIGHT_WHITE}@${PR_BRIGHT_BLUE}%1~):${PR_RESET}${PR_BLUE}.${PR_BRIGHT_BLACK}.${PR_RESET} '

	fi


}

setprompt

#	alias ls="ls --color"
#	alias lsl="ls -lh --color"
#	alias lsa="ls -alh --color"

#	d=.dircolors
#	test -r $d && eval "$(dircolors $d)"

#PROMPT='%n@%m [%1~] ' 

if [ `tty` = /dev/tty1 ]; then
	startx 2> /dev/null
	logout
fi
