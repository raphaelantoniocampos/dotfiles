function zclean --wraps='sudo ~/dotfiles/zclean.sh' --wraps='sudo sh ~/dotfiles/zclean.sh' --wraps='sudo sh ~/dotfiles/scripts/zclean.sh' --wraps='sudo sh ~/.config/scripts/zclean.sh' --description 'alias zclean sudo sh ~/.config/scripts/zclean.sh'
  sudo sh ~/.config/scripts/zclean.sh $argv
        
end
