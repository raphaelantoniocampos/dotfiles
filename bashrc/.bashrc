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

# NOTE: AWS keys
function con() {
    if [ -f "$HOME/repositories/personal/$1/ssh.txt" ]; then
        COMMAND=$(cat "$HOME/repositories/personal/$1/ssh.txt")
        eval "$COMMAND"
    else
        echo "Arquivo $HOME/repositories/personal/$1/ssh.txt não encontrado."
    fi
}

# NOTE: OpenSuse alias
alias zup="sudo zypper refresh && sudo zypper dup --allow-vendor-change"
alias zin="sudo zypper in"
alias zse="sudo zypper se"
alias zclean='sudo zypper packages --unneeded | grep ^i > /tmp/unneeded_packages.txt && if [ -s /tmp/unneeded_packages.txt ]; then cat /tmp/unneeded_packages.txt | cut -d '\''|'\'' -f3 | xargs sudo zypper rm -y --clean-deps; else echo "No unneeded packages found."; fi'
alias zclean_old='sudo zypper packages --unneeded | grep ^i|cut -d '\''|'\'' -f3|xargs sudo zypper rm -y --clean-deps'

# NOTE:Gleam Run Lustre Fullstack
alias glustre="gleam run -m lustre/dev build --outdir=../server/priv/static --minify"
