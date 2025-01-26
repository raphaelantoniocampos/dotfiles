# Starting OpenSuse

### Install git, neovim
sudo zypper in git neovim

### Clone dotfiles
git clone https://github.com/raphaelantoniocampos/dotfiles

### Make zypper faster
sudo nvim /etc/zypp/zypp.conf

download.max_concurrent_connections=10

download.min_download_speed = 20000

### Install codecs
sudo zypper in opi

opi codecs
 
### Install stow
sudo zypper in stow

### Update System
sudo zypper refresh

sudo zypper dup --allow-vendor-change

### Install Window Manager
zin i3 picom feh kitty vim polybar rofi

### Reboot to start I3
sudo reboot now

### Install essential apps
zin -y NetworkManager-applet ripgrep fd nodejs22 npm22 lua51-luarocks
