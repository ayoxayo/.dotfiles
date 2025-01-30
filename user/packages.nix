{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    eza

    tor-browser
    mullvad-browser
    mullvad-vpn
    tutanota-desktop
    
    obs-studio

    libreoffice-qt6-fresh
    qbittorrent-enhanced
    gimp-with-plugins
    krita
    vlc
  ];
}
