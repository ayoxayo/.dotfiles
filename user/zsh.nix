# zsh config module
{ config, pkgs, ... }:

let
  myAliases = {
	"ls" = "eza -Alhs size --time-style='+%d-%m-%y %H:%M:%S' --group-directories-first";
	".." = "cd ..";
	"..." = "cd ../..";
	"...." = "cd ../../..";
	"....." = "cd ../../../..";
	"fucking" = "sudo";
	":wq" = "exit";
	"cdc" = "cd .dotfiles/";
	"e" = "nvim";
	"grep" = "grep --color=auto";
	"update" = "sudo nixos-rebuild switch --flake .dotfiles";
	"updatee" = "sudo nixos-rebuild switch --flake .";
	"homie" = "home-manager switch --flake .dotfiles";
	"homiee" = "home-manager switch --flake .";
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
