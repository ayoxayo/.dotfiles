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
  ];
}
