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
    
    obsidian
    syncthingtray
    tutanota-desktop
    signal-desktop
    bitwarden-desktop
    nerd-fonts.hack
  ];
}
