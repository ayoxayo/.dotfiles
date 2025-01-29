{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    dataDir = "/home/igor";
    openDefaultPorts = true;
    configDir = "/home/igor/.config/syncthing";
    user = "igor";
    group = "users";
    guiAddress = "https://127.0.0.1:8384";
    overrideDevices = false;
    overrideFolders = false;
    settings.devices = {
      "P8" = { id = "UONLQPL-LV6IMBL-73BKACW-KPXYNSF-W2VQAVD-BN3NGBR-4ZQS7UW-YTAMAQ6"; };
      "yoga" = { id = "27W5BKC-PHTABYZ-U5NETPT-H72KGHZ-HHW3R7D-XOV7MTZ-OBT77PC-TFILEQA"; };
      "RPI" = { id = "CA3XEG5-CNADMSJ-IZBGT4K-YXMJATG-VIG4QDF-OM3MA33-YDIJCEH-RUS2FAX"; };
    };
    #settings.folders = {
    #  "Obsidianx" = {
    #    path = "/home/igor/Obsidianx";
    #    devices = [ "yoga" "P8" "RPI" ];
    #  };
    #};
    settings.gui = {
      user = "AYO";
      password = "1980";
    };
  };
}
