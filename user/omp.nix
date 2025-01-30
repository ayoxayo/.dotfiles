#oh my posh config module
# default on
{ pkgs, config, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    useTheme = "catppuccin_mocha";
  };
}
