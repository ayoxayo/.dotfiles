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
    tmux
    tmuxPlugins.catppuccin
   
    inkscape

    obsidian
    jellyfin-media-player
    syncthingtray
    signal-desktop
    bitwarden-desktop
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
  ];
}
