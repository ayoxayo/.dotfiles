{ config, lib, pkgs, ... }:

let
  gpuIDs = [
    "10de:1f06" # Graphics
    "10de:10f9" # Audio
    "10de:1ada" # usb
    "10de:1adb" # usb
  ];
in
let
  gpuUsbDriverId = "0000:02:00.2"; # lspci -nnv -D     find the gpu related id not managed by vfio 
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
 nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  # Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.kernelModules = with config.boot.kernelModules; [ 
  "msr" 
  "vfio-pci"  
  "vfio_iommu_type1"
  "vfio"
];

  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.kernelParams = [ 
"nohibernate" 
"init_on_alloc=0" 
"zfs.zfs_arc_sys_free=${toString(1024*1024*1024*24)}" 
"console=ttyUSB0,115200n8" 
"console=tty1"
"intel_iommu=on" 
"iommu=pt"
("vfio-pci.ids=" + builtins.concatStringsSep "," gpuIDs)
];

# boot.blacklistedKernelModules = [ "nvidia" "nouveau" ];
 services.udev.extraRules = ''
      SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
 '';

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  boot.zfs.extraPools = [ "sn640" ];

  fileSystems."/mnt/data" = {
    device = "sn640/data";
    fsType = "zfs";
  };

  fileSystems."/mnt/erigondata" = {
    device = "sn640/erigondata";
    fsType = "zfs";
  };  
  fileSystems."/mnt/win11" = {
    device = "sn640/win11";
    fsType = "zfs";
  };  
  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;
  services.zfs.autoScrub.interval = "daily";

  boot.loader.grub.extraConfig = ''
      serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
      terminal_input --append serial
      terminal_output --append serial
  '';

  users.users.root.extraGroups = [ "dialout" "libvirtd" ];
  services.openssh.settings.PermitRootLogin = "yes";
  services.openssh.enable = true;
  systemd.services."serial-getty@".environment.TERM = "xterm-256color";
  #services.getty.extraArgs = [''115200 ''];
 systemd.services."serial-getty@" =
      { serviceConfig.ExecStart = lib.mkForce [ ];
        restartIfChanged = false;
      };

  systemd.services."serial-getty@ttyUSB0" = {
      enable = true;
      wantedBy = [ "getty.target" ];
      serviceConfig.Restart = "always";
      serviceConfig.ExecStart = [
        ""
        "${pkgs.util-linux}/sbin/agetty --login-program ${pkgs.shadow}/bin/login 115200 %I xterm-256color"
      ];
  };
  networking.hostId = "286c56fb";
  networking.hostName = "nixos_x99"; # Define your hostname.

networking.wireless.iwd.enable = true;
networking.wireless.networks = {        
  x40gt = {
    psk = "1234567890";
  };
};
 
  
  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

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
  #services.xserver.displayManager.lightdm.enable = true;

  services.displayManager.enable = true;
  #services.xserver.displayManager.startx.enable = true;
  services.openssh.settings.X11Forwarding = true;

  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  systemd.services.undervolt = {
    enable = true;
    description = "undervolt";
    # unitConfig = {
    # };
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.undervolt}/bin/undervolt --core -70 --cache -70";
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  # };

  users.users.shiwenze = {
    isNormalUser = true;
    description = "for postgresql";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    
    # note: ssh-copy-id will add user@your-machine after the public key
    # but we can remove the "@your-machine" part
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
    # rustdesk
    tmux
    pciutils
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
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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

  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-+" "ve-+" ];
    externalInterface = "wlp4s0";
    # Lazy IPv6 connectivity for the container
    enableIPv6 = true;
  };

  networking.hosts = {
   "20.205.243.166" = [ "github.com" ];
   "185.199.108.133" = [ "raw.githubusercontent.com" ];
  };

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

  systemd.services.localhttpproxy = {
    enable = true;

    path = [ "/run/current-system/sw" pkgs.coreutils ];
    description = "localhttpproxy";
    unitConfig = {
      After = "network.target";
    };
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      WorkingDirectory = "/mnt/data/git/node-socks5-server";
      # KillMode = "process";
      Restart = "always";
      RestartSec = 0;

      ExecStart = "${pkgs.nodejs_22}/bin/node local-http.js";
    };
  };

virtualisation.libvirtd.enable = true;
programs.virt-manager.enable = true;

services.create_ap.enable = true;
services.create_ap.settings = {
  INTERNET_IFACE = "wlan0";
  PASSPHRASE = "12345678";
  SSID = "iw7260";
  WIFI_IFACE = "wlan0";
  FREQ_BAND= "2.4";
  GATEWAY= "192.168.12.1";
};

systemd.services.forceRebindNVUSB = { # patch code unbind and bind use vfio
    enable = true;
    description = "forceRebindNvUsb";
    wantedBy = [ "multi-user.target" ];
    script = ''
      echo -n "${gpuUsbDriverId}" > /sys/bus/pci/drivers/xhci_hcd/unbind
      echo -n "${gpuUsbDriverId}" > /sys/bus/pci/drivers/vfio-pci/bind
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };

}
