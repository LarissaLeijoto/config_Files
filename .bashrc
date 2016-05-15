# Bash configuration

# Loads up aliases
if [[ -e ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi

# Loads up completions
if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
	source /etc/bash_completion
fi

# Command line history
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s histappend
export HISTIGNORE="&:[bf]g:exit:l[as]"
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Prompt
eval "$(sed 's/01/01/g' <<< $(dircolors -b) )"
dircolor=6
prompt="\[\e[0;37m\]\342\224\214\342\224\200"
prompt="${prompt}\[\e[0;37m\]\342\235\254"
prompt="${prompt}\[\e[1;37m\]\u@\H"
prompt="${prompt}\[\e[1;37m\] \342\214\201 "
prompt="${prompt}\[\e[0;3${dircolor}m\]\w"
prompt="${prompt}\[\e[0;37m\]\342\235\255"
prompt="${prompt}\[\e[0;37m\]\n\342\224\224\342\230\233"
prompt="${prompt}\[\e[0;37m\] "
export PS1=${prompt}
alias ls='ls --color=auto'
