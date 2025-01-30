# Users module, don't forget to add a password with 'passwd'!
{ ... }:
{
  users.users.igor = {
    isNormalUser = true;
    description = "igor";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  # extra
 users.users.magda = {
    isNormalUser = true;
    description = "magda";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
