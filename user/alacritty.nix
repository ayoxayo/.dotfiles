# alacritty config module
{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 0;
	columns = 0;
	window.decorations = "None";
	window.opacity = 0.50;
	window.blur = true;
	window.startup_mode = "Maximized";
     	window.title = "Alacritty";
        window.dynamic_title = true;
      };
    };
  };
}
