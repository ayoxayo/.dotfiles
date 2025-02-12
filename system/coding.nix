# packages for developing
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-community
    vscodium-fhs
    
    nixpkgs-fmt
    alejandra
    nixfmt-rfc-style

    jdk
    jdk23
    jdk17
  ];
}
