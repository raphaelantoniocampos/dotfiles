# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "raphael-x555lf"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

 #  # Enable OpenGL
 #  hardware.opengl = {
 #    enable = true;
 #  };
	#
 #  # Load nvidia driver for Xorg and Wayland
 #  services.xserver.videoDrivers = ["nvidia"];
	#
 #  hardware.nvidia = {
	#
 #    # Modesetting is required.
 #    modesetting.enable = true;
	#
 #    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
 #    # Enable this if you have graphical corruption issues or application crashes after waking
 #    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
 #    # of just the bare essentials.
 #    powerManagement.enable = false;
	#
 #    # Fine-grained power management. Turns off GPU when not in use.
 #    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
 #    powerManagement.finegrained = false;
	#
 #    # Use the NVidia open source kernel module (not to be confused with the
 #    # independent third-party "nouveau" open source driver).
 #    # Support is limited to the Turing and later architectures. Full list of 
 #    # supported GPUs is at: 
 #    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
 #    # Only available from driver 515.43.04+
 #    # Currently alpha-quality/buggy, so false is currently the recommended setting.
 #    open = false;
	#
 #    # Enable the Nvidia settings menu,
	# # accessible via `nvidia-settings`.
 #    nvidiaSettings = true;
	#
 #    # Optionally, you may need to select the appropriate driver version for your specific GPU.
 #    package = config.boot.kernelPackages.nvidiaPackages.stable;
 #  };
 
  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Enable i3 Window Manager.
  services.xserver.windowManager.i3.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "br";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    # pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raphaelac = {
    isNormalUser = true;
    description = "raphaelac";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    librewolf
    steam
    kitty
    stow
    neofetch
    ];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "0xProto" ]; })
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  neovim
  wget
  ripgrep
  fd
  xclip
  i3
  feh
  picom
  polybar
  rofi
  git
  killall
  firefox
  lshw
  # programming languages
  gleam
  python3
  zig
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

