# zsh config module
{ config, ... }:
let
  myAliases = {
	"ls" = "eza -Alhs size --time-style='+%d-%m-%y %H:%M:%S' --group-directories-first";
	".." = "cd ..";
	"..." = "cd ../..";
	"...." = "cd ../../..";
	"....." = "cd ../../../..";
	"fucking" = "sudo";
	"cdc" = "cd .dotfiles/";
	"e" = "nvim";
	"grep" = "grep --color=auto";
	"update" = "sudo nixos-rebuild switch --flake .dotfiles";
	"updatee" = "sudo nixos-rebuild switch --flake .";
	"homie" = "home-manager switch --flake .dotfiles";
	"homiee" = "home-manager switch --flake .";
        "cdm" = "cd /home/igor/Documents/Server/";
        "minecraft" = "java -Xmx8G -jar fabric-server-mc.1.20.1-loader.0.16.10-launcher.1.0.1.jar nogui";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = myAliases;
     initExtra = "fastfetch";

    history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
