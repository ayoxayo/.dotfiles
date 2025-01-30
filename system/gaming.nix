# gaming module; add all gaming stuff
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
  ];
  programs.gamemode.enable = true;

  #protonGE
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/igor/.steam/root/compatibilitytools.d/";
  }; 
}
