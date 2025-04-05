function zse --wraps='sudo zypper se' --description 'alias zse=sudo zypper se'
  sudo zypper se $argv
        
end
