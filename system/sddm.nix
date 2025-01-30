# sddm
{ pkgs, lib, ... }:
{
  services.displayManager.sddm = lib.mkForce {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm
  ];
}
