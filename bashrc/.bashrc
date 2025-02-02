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

test -s ~/.alias && . ~/.alias || true

# NOTE: Keys
function key() {
    KEY="$HOME/personal/keys/$1"
    cat $KEY
}

# NOTE: OpenSuse alias
alias zup="sudo zypper refresh && sudo zypper dup --allow-vendor-change"
alias zin="sudo zypper in"
alias zse="sudo zypper se"
alias zclean='sudo zypper packages --unneeded | grep ^i > /tmp/unneeded_packages.txt && if [ -s /tmp/unneeded_packages.txt ]; then cat /tmp/unneeded_packages.txt | cut -d '\''|'\'' -f3 | xargs sudo zypper rm -y --clean-deps; else echo "No unneeded packages found."; fi'
alias zclean_old='sudo zypper packages --unneeded | grep ^i|cut -d '\''|'\'' -f3|xargs sudo zypper rm -y --clean-deps'

# NOTE:Gleam Run Lustre Fullstack
alias glustre="gleam run -m lustre/dev build --outdir=../server/priv/static --minify"

# NOTE:Trash-cli
alias rm='echo "This is not the command you are looking for. (If you really want it use \rm)"; false'

alias tr='trash'
alias trp='trash-put'
alias tre='trash-empty'
alias trl='trash-list'
alias trr='trash-restore'
alias trrm='trash-rm'

