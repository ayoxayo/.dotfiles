# solaar config; figuree out how to add rules for mouse gestures
# default on
{ config, pkgs, ... }:

{
  services.solaar = {
    enable = true;
    package = pkgs.solaar;
    window = "hide";
    batteryIcons = "solaar";
    extraArgs = "";
  };
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true; # for solaar to be included
}
