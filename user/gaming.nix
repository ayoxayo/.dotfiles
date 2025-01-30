{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    heroic
    gogdl
    lutris-free
  ];
}
