# Created by newuser for 5.9
eval "$(starship init zsh)"

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
