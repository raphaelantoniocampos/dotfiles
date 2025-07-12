function zclean --wraps='sudo ~/dotfiles/zclean.sh' --wraps='sudo sh ~/dotfiles/zclean.sh' --description 'alias zclean sudo sh ~/dotfiles/zclean.sh'
  sudo sh ~/dotfiles/zclean.sh $argv
        
end
