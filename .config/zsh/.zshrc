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

# Make cursor pretty (copied from Luke Smith)
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#vim mode
bindkey -v

#zsh history configuration

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

#Aliases
alias ls="ls --color=auto"
alias wlsblk="watch -n1 lsblk"
alias s="watch -n1"
alias mpv="mpv --hwdec=auto"
alias dmenu="wofi -d"
alias config='git --git-dir=$HOME/dots --work-tree=$HOME'
alias sc-imh='rview /usr/share/sc-im/sc-im_help'

## opam configuration
#[[ ! -r /home/johann/.opam/opam-init/init.zsh ]] || source /home/johann/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Environment Variables
#
export XDG_SCREENSHOTS_DIR=$HOME/Pictures/Screenshots
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export MANPAGER='nvim +Man!'
export MANPAGER='less'
export GOPATH=$HOME/.local/share/Go

# Source stuff from private zsh config
source $HOME/.config/zsh/private
