# default packages
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    neovim
    gurk-rs
    ripgrep
    alacritty
    
    guitarix
    qjackctl
    qpwgraph
    jack1
    jack2

    vscodium-fhs

    jellyfin-media-player
    delfin
    obsidian
    syncthingtray
    tutanota-desktop
    signal-desktop
    bitwarden-desktop
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
  ];
}
