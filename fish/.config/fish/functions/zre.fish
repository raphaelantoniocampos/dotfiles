function zre --wraps='sudo zypper remove' --description 'alias zre=sudo zypper remove'
  sudo zypper remove $argv
        
end
