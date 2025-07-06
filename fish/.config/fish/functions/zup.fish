function zup --wraps='sudo zypper refresh && sudo zypper dup --allow-vendor-change' --description 'alias zup=sudo zypper refresh && sudo zypper dup --allow-vendor-change'
  sudo zypper refresh && sudo zypper dup --allow-vendor-change $argv
        
end

