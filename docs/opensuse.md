# Starting OpenSuse

### Install git, neovim
sudo zypper in git vim

### Clone dotfiles
git clone https://github.com/raphaelantoniocampos/dotfiles

### Make zypper faster
sudo vim /etc/zypp/zypp.conf

download.max_concurrent_connections=10

download.min_download_speed = 20000

### Install codecs
sudo zypper in opi

opi codecs -n

### Update System
sudo zypper refresh

sudo zypper dup --allow-vendor-change

### Install stow
sudo zypper in stow

### Install dotfiles apps and stow
zin kitty nvim hyprland
cd dotfiles/
stow kitty/
stow nvim/
stow hyprland/
...

### Reboot to start I3
sudo reboot now

### Install trash-cli (you WILL want to use it)
zin trash-cli

### verify gpu instalation
