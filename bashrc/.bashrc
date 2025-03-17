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

# NOTE: Keys
function key() {
    KEY="$HOME/personal/keys/$1"
    cat $KEY
}

alias icat="kitty icat"
alias ls="lsd"
alias cat="bat"

# NOTE: OpenSuse alias
alias zup="sudo zypper refresh && sudo zypper dup --allow-vendor-change"
alias zin="sudo zypper in"
alias zse="sudo zypper se"
alias zre="sudo zypper remove"
alias zclean='sudo zypper packages --unneeded | grep ^i > /tmp/unneeded_packages.txt && if [ -s /tmp/unneeded_packages.txt ]; then cat /tmp/unneeded_packages.txt | cut -d '\''|'\'' -f3 | xargs sudo zypper rm -y --clean-deps; else echo "No unneeded packages found."; fi'

# NOTE:Trash-cli
alias rm='echo "This is not the command you are looking for, try trp. (If you really want it use \rm)"; false'

alias tr='trash'
alias trp='trash-put'
alias tre='trash-empty'
alias trl='trash-list'
alias trr='trash-restore'
alias trrm='trash-rm'

