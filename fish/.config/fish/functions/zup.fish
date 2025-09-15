function zup --wraps='sudo zypper refresh && sudo zypper dup --allow-vendor-change' --wraps='sudo zypper refresh && sudo zypper dup --allow-vendor-change -y -l' --description 'alias zup sudo zypper refresh && sudo zypper dup --allow-vendor-change -y -l'
  sudo zypper refresh && sudo zypper dup --allow-vendor-change -y -l $argv
        
end
