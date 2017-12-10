# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=10000
SAVEHIST=10000

export PATH=/home/stephen/bin:$PATH
#export JAVA_HOME=/usr/lib/jvm/java-6-sun
#export CATALINA_HOME=/usr/share/tomcat6
#export CLASSPATH=/usr/share/maven-repo/
export EDITOR=vim

setopt correct appendhistory autocd extendedglob nomatch notify
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

#-----------SPECTRUM_LS------------------
#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done


ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-This used to be in some other language I dont understand}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

#-------SPECTRUM_LS---------------


d=.dircolors
test -r $d && eval "$(dircolors $d)"

# vcs_info configuration
autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '(%b)%{%f%}'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%{%F{yellow}%B%}★%{%f%}'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%B%}★%{%f%}'
zstyle ':vcs_info:*' formats "%{%F{012}%}◀%{%F{012}%} %b %c%u%{%f%} %{%F{012}%}► %{%F{007}%}"

if [[ "$TERM" == "xterm" ]]; then
	export TERM=xterm-256color
fi

function precmd() {

		if [[ -w $PWD ]]; then
			#PR_PWDCOLOR=$'%{\e[32m%}'
			PR_PWDCOLOR="%{%F{002}%}"
		else
				PR_PWDCOLOR="%{%F{001}%}"
		fi
		vcs_info

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
		#PR_PWD_DEFAULT=$'%{\e[38;5;78m%}'
		PR_PWD_YELLOW=$'%{\e[38;5;226m%}'
		PR_PWD_DEFAULT="%{%F{022}%}"

#		PROMPT=$'${PR_RED} \u2584
#${PR_BRIGHT_BLUE}\u2587${PR_RED}\u2518${PR_BRIGHT_WHITE}%n${PR_BLUE}@${PR_BRIGHT_BLUE}%m ${PR_RESET}${PR_BLUE}(${PR_PWDCOLOR}%~${PR_BLUE})
#${PR_BRIGHT_BLUE}\u2514${PR_GREEN}\u2586${PR_RESET} '

		PROMPT=$'
%{%F{013}%}%n%{%F{007%} ⇨ %{%F{014}%}%m%{%F{007}%} ⇨ ${PR_PWDCOLOR}%~${PR_BLUE} ${vcs_info_msg_0_}
%{%b%}${PR_RESET}%{%F{013}%}➤%{%F{012}%}➤%{%F{014%}➤${PR_RESET} '
#		PROMPT=$'
#${PR_RESET}${PR_BLUE}(${PR_PWDCOLOR}%~${PR_BLUE}) ${vcs_info_msg_0_}> ${PR_RESET}'
	else

		PROMPT=$'%n@%m (%~)\n>>> '
	fi
}

setprompt

if [ $(tty) = '/dev/tty1' ]; then
	startx 2> /dev/null
	logout
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

############## Aliases
alias ls="ls --color -h --group-directories-first"
alias lsa="ls -Al"
alias lsl="ls -l"
alias du1="du -h --max-depth=1"

#alias to make Octopress not glob
alias rake="noglob rake"

#alias pacman="pacman-color"
alias vi="vim"


