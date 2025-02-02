# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [ 
       ./system/hardware-configuration.nix
      #/etc/nixos/hardware-configuration.nix #for bad times
      ./system/ai.nix
      ./system/audio.nix
      ./system/coding.nix
      ./system/extra-pkgs.nix   #off
      ./system/gaming.nix       #off 
      ./system/graphics.nix     #off
      ./system/minecraft.nix    #off 
      ./system/packages.nix
      ./system/qemu.nix         #off 
      ./system/sddm.nix
      #./system/singlegpupassthrough.nix
      ./system/solaar.nix
      ./system/ssh.nix          #off
      ./system/syncthing.nix
      ./system/users.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Networking & Bluetooth
  networking.hostName = "NixAYO"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Timezone & Locale
  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  # Desktop Environment
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "euro";
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # misc packages
  
  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  #kdeconnect
  programs.kdeconnect.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # enabling flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
