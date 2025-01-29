# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
       ./hardware-configuration.nix
      #/etc/nixos/hardware-configuration.nix
      ./system/solaar.nix
      ./system/syncthing.nix
      ./system/steam.nix
      ./user/minecraft.nix
      ./system/qemu.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "NixAYO"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  #hardware.bluetooth.enable = true; # enables support for Bluetooth
  #hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

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

  services.xserver.enable = true;
  
  services.displayManager.sddm = lib.mkForce {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };


  services.desktopManager.plasma6.enable = true;



  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  





  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "euro";
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.igor = {
    isNormalUser = true;
    description = "igor";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Magda
  users.users.magda = {
    isNormalUser = true;
    description = "magda";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  #kdeconnect
  programs.kdeconnect.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    signal-desktop
    neovim
    alacritty
    wget
    curl
    obsidian
    quickemu
    quickgui
    syncthingtray
    bitwarden-desktop
    nerd-fonts.hack
    monocraft
    packwiz

    #try
    catppuccin-sddm
    
    sweethome3d.application
    sweethome3d.furniture-editor
    sweethome3d.textures-editor

    gurk-rs

    jetbrains.idea-community
    nixpkgs-fmt
    alejandra
    nixfmt-rfc-style

    jdk
    jdk23
    jdk17
    ripgrep
  ];

  
  # Add environment variable under environment.systemPackages
  environment.variables = {
    JAVA_TOOL_OPTIONS = "-Dcom.eteks.sweethome3d.j3d.useOffScreen3DView=true";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh = {
  #enable = true;
  #ports = [ 22 ];
  #settings = {
  #  AllowUsers = null; # Allows all users by default. Can be #[ "user1" "user2" ]
  #  UseDns = true;
  #  X11Forwarding = false;
  #  };
  #};

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 25566 ];
  networking.firewall.allowedUDPPorts = [ 25566 ];
 
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  networking.nat.forwardPorts = [
    {
      destination = "192.168.0.82:25566";
      proto = "tcp";
      sourcePort = [ 25566 ];
    }
  ];

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
