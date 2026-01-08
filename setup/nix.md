# Starting Nixos
### Temporarily install git and vim

nix-shell -p git vim

### Clone the repo into place:

git clone https://github.com/raphaelantoniocampos/nix-config ~/nix-config/

### Add the nixos unstable channel to nix-channel

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

### Add the kernel latest update into configuration.nix

sudo vim /etc/nixos/configuration.nix
boot.kernelPackages = pkgs.linuxPackages_latest;

### Upgrade and reboot

sudo nixos-rebuild boot --upgrade
reboot

### Backup the original configuration

sudo mv /etc/nixos /etc/nixos.bak

### Replace it with the symlink:

sudo ln -s ~/nix-config/ /etc/nixos

### Copy the system.stateVersion from backup and change in the conf.nix

system.stateVersion = "24.05"; # Did you read the comment?

### Grant user ownership of the directory

sudo chown -R raphaelac ~/nix-config/

### Rebuild

sudo nixos-rebuild switch
