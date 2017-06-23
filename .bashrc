# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

###############################################################################
# Table of contents
###############################################################################

# 1)  Source aliases and completion                          SOURCE_OTHER_FILES
# 2)  Make terminal working (locale)                           WORKING_TERMINAL
# 3)  Make terminal pretty (colours)                            PRETTY_TERMINAL
# 4)  Bash history settings                                    HISTORY_SETTINGS
# 5)  Homebrew stuff (OSX specific)                                OSX_HOMEBREW
# 6)  Tweak behaviour of shell                                  SHELL_BEHAVIOUR
# 7)  Language specific stuff
#     8a)  Python virtualenvwrapper                        PY_VIRTUALENVWRAPPER
# 8)  cowsay                                                         COWSAY_FUN
# 9)  Open up tmux (pi specific)                                        PI_TMUX
# 10) Path                                                          SET_UP_PATH

###############################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

###############################################################################
# Source aliases and completion                              SOURCE_OTHER_FILES
###############################################################################

# Source private stuff
# Also sets $computer and $platform
[ -f "$HOME/.bashrc-private.bash" ] && source ~/.bashrc-private.bash

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[ -f "$HOME/.git-completion.bash" ] && source ~/.git-completion.bash

alias cd="cd -P"
if [[ $computer == "pi" ]]; then
	alias fuckthis="rm"; alias rm="trash-put"; alias trash-restore="restore-trash"
fi
alias ls="ls -hlF --color=always"
alias la="ls -hlaF --color=always"
alias pupp="pbpaste | curl -s -T - https://p.iotek.org | tr -d '\n' | pbcopy ; echo -ne '\007'"
fupp() {
	curl -s -T - https://p.iotek.org < "$1" | tr -d '\n' | pbcopy ; echo -ne '\007'
}
alias upp="curl -s -T - https://p.iotek.org | tr -d '\n' | pbcopy ; echo -ne '\007'"
if [[ $platform != "osx" ]]; then
	alias crontab="crontab -i"
fi

alias rand="LC_ALL=C tr -dc A-Za-z0-9_- < /dev/urandom | head -c $1"
alias easyrand="LC_ALL=C tr -dc a-z < /dev/urandom | head -c $1"
alias npass="easyrand 20 | pbcopy"
alias make="make -j $(getconf _NPROCESSORS_ONLN)"

###############################################################################
# Make terminal working (locale)                               WORKING_TERMINAL
###############################################################################

# Set locale
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"

# Let you send C-s without stopping output (for text editors like vim!)
stty -ixon

###############################################################################
# Make terminal pretty (colours)                                PRETTY_TERMINAL
###############################################################################

# tmux -2 forces tmux to assume the terminal supports 256 colours
alias tmux="tmux -2"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Get ls colours (at least on osx)
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

###############################################################################
# Bash history settings                                        HISTORY_SETTINGS
###############################################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

###############################################################################
# Homebrew stuff (OSX specific)                                    OSX_HOMEBREW
###############################################################################

if [[ $platform == "osx" ]]; then
	# Add all the coreutils to the beginning of path...
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
	# Unless it's sbin stuff, then we use the osx local sbin first
	export PATH="/usr/local/sbin:$PATH"

	# Use GNU manpages
	MANPATH=$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH

	# Use Homebrew's keg-only-and-not-linked binaries for login shells by us
	PATH="$(echo /usr/local/opt/*/bin | tr ' ' ':'):$PATH"

	# Use Homebrew's gcc-5 (what happened to 5? why is it 6 now?) (idk...)
	export CC=/usr/local/bin/gcc-6
	export CXX=/usr/local/bin/g++-6
	export CPP=/usr/local/bin/cpp-6
	export LD=/usr/local/bin/gcc-6
	alias gcc="cc"
	alias g++="c++"
fi

###############################################################################
# Tweak behaviour of shell                                      SHELL_BEHAVIOUR
###############################################################################

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

###############################################################################
# Python virtualenvwrapper                                 PY_VIRTUALENVWRAPPER
###############################################################################

export WORKON_HOME=$HOME/.virtualenvs # The default
export PROJECT_HOME=$HOME/python
source $(which virtualenvwrapper_lazy.sh)

###############################################################################
# cowsay                                                             COWSAY_FUN
###############################################################################

if [[ $computer == "pi" ]]; then
	cowsay "Moo moo moo, welcome back pi."
elif [[ $computer == "gracefu" ]]; then
	cowsay "Yo wassap."
elif [[ $computer == "pysweeper" ]]; then
	cowsay "Sweep sweep... sigh, there's so much cleaning to do..."
else
	cowsay "Serious business only."
fi

###############################################################################
# Open up tmux (pi specific)                                            PI_TMUX
###############################################################################

if [[ $computer == "pi" ]]; then
	if command -v tmux>/dev/null; then
		[[ ! $TERM =~ screen ]] && [ -z $TMUX ] &&
		tmux -2 new -A -s pi
	fi
fi

if [[ $computer == "pysweeper" ]]; then
	if command -v tmux>/dev/null; then
		[[ ! $TERM =~ screen ]] && [ -z $TMUX ] &&
		tmux -2 new -A -s sweep
	fi
fi

###############################################################################
# Path                                                              SET_UP_PATH
###############################################################################

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# Setup Go
export GOPATH=$HOME/go
export PATH=/usr/local/go/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# Setup Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"
