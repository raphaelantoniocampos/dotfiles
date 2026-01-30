# Nvim Link
cmd /c mklink /D "C:\Users\$ENV:USERNAME\AppData\Local\nvim" "C:\Users\$ENV:USERNAME\dotfiles\nvim\.config\nvim"

# Vim Link
cmd /c mklink "C:\Users\$ENV:USERNAME\_vimrc" "C:\Users\$ENV:USERNAME\dotfiles\vim\.vimrc"

# Install Recycle Module
Install-Module -Name Recycle -RequiredVersion 1.5
