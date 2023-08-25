# configure language
export LANG=en_US.UTF-8

# ignore duplicate lines and lines starting with space. 
# these are not appended to history

HISTCONTROL=ignoreboth

# append to history file. Do not overwrite
shopt -s histappend

# configure history length
HISTSIZE=2000
HISTFILESIZE=2000

# enter directory if supplied as a name to the shell
shopt -s autocd

# uses nvim as EDITOR
EDITOR=nvim
export EDITOR

# uses less as PAGER
PAGER=less
export PAGER

# browser
BROWSER=librewolf

# set git prompt variables

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_HIDE_IF_PWD_IGNORED=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

export PATH=$PATH:/home/bdavidson/.cargo/bin
export PATH=$PATH:/home/bdavidson/.local/bin
export PATH=$PATH:/home/bdavidson/tools/zeal-cli

# fzf configuration
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
