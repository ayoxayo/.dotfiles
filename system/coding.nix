# packages for developing
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-community
    
    nixpkgs-fmt
    alejandra
    nixfmt-rfc-style

    jdk
    jdk23
    jdk17

    gradle
    gradle_7
    gradle_8
  ];
}
