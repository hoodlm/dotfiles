# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


# enable color support of ls and also add handy aliases
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

PATH=${PATH}:~/.local/bin

# Git configuration
git config --global core.editor "vim"

# Golang
export GOPATH="$HOME/.local/go"

# Python
pyenv_root="$HOME/.pyenv"
if [[ -d $pyenv_root ]]; then
  PATH=${PATH}:${pyenv_root}/bin
  eval "$(pyenv virtualenv-init -)"
fi

# Ruby
PATH=${PATH}:/usr/share/rvm/bin

# Rust
PATH=${PATH}:${HOME}/.local/RustRover/bin
PATH=${PATH}:${HOME}/.cargo/bin

# Kitty
PATH=${PATH}:${HOME}/.local/kitty.app/bin

# Node
export NPM_CONFIG_PREFIX=${HOME}/.npm/
export PATH="${PATH}:${NPM_CONFIG_PREFIX}/bin"

# sfeed
sfeed_root="$HOME/.sfeed"
if [[ -d $sfeed_root ]]; then
  alias rss='SFEED_URL_FILE=${sfeed_root}/urls sfeed_curses ${sfeed_root}/feeds/*'
fi
