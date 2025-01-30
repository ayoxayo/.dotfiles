# default packages
{ config, pkgs, ... }:
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
    signal-desktop
    bitwarden-desktop
    nerd-fonts.hack
  ];
}
