function zin --wraps='sudo zypper in' --description 'alias zin=sudo zypper in'
  sudo zypper in $argv
        
end
