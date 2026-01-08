# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/raphaelac/zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Alias
alias cat="bat"
alias cd="z"
alias icat="kitty icat"
alias lg="lazygit"
alias trp="trash-put"
alias ls="lsd"
alias uvr="uv run"
alias zup="sh ~/.config/scripts/zup.sh"
alias zclean="sh ~/.config/scripts/zclean.sh"
alias rm='echo "This is not the command you are looking for, try trp. (If you really want it use \rm)"; false'

fastfetch --logo opensuse
