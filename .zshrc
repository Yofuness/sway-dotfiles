# Created by newuser for 5.8# Luke's config for the Zoomer Shell


#fish-like autocomplete config
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
# git clone addresses:
# https://github.com/zsh-users/zsh-autosuggestions.git
# https://github.com/zsh-users/zsh-syntax-highlighting.git

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


#enable modules:

autoload -Uz compinit promptinit
compinit   # enables zsh advanced autocompletion
promptinit # enables changing the prompt theme

#set the default prompt here:

prompt adam1


#zsh history configuration

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# opam configuration
[[ ! -r /home/johann/.opam/opam-init/init.zsh ]] || source /home/johann/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Aliases

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Environment Variables

export XDG_SCREENSHOTS_DIR=$HOME/Pictures/Screenshots
