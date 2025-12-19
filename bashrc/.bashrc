# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

test -s ~/.alias && . ~/.alias || true

eval "$(starship init bash)"

alias icat="kitty icat"
alias ls="lsd"
alias cat="bat"

# NOTE: OpenSuse alias
alias zup="sudo zypper refresh && sudo zypper dup --allow-vendor-change"

# NOTE:Trash-cli
alias rm='echo "This is not the command you are looking for, try trp. (If you really want it use \rm)"; false'

# Added by flyctl installer
export FLYCTL_INSTALL="/home/raphaelac/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
