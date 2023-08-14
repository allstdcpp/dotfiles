# do not continue processing if not running interactively

case $- in
    *i*) ;;
      *) return;;
esac
#
# import git-prompt
if [ -f ~/dotfiles/private/git/git-prompt.sh ]; then
    . ~/dotfiles/private/git/git-prompt.sh
fi

# import environment

if [ -f ~/dotfiles/private/bash/.env.sh ]; then
    . ~/dotfiles/private/bash/.env.sh
fi


# import aliases
if [ -f ~/dotfiles/private/bash/.aliases.sh ]; then
    . ~/dotfiles/private/bash/.aliases.sh
fi

# import bash completion

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
        source /usr/local/share/bash-completion/bash_completion.sh

# start starship
eval "$(starship init bash)"
