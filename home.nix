{ pkgs, ... }:
{
  imports = [
    ./user/plasma/plasma.nix
    ./user/zsh.nix
    ./user/alacritty.nix
    ./user/firefox/firefox.nix
    ./user/fastfetch.nix
    ./user/omp.nix
    ./user/git.nix
    ./user/nvf-configuration.nix
    ./user/gaming.nix
    ./user/packages.nix
  ];	

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "igor";
  home.homeDirectory = "/home/igor";

  home.packages = with pkgs; [
      ardour
      calf
      carla
      geonkick
      helm
      lsp-plugins
      mixxx # DJ mixer
      noise-repellent
      paulstretch
      puredata
      qjackctl
      sfizz # sfz sampler
      supercollider
      surge
      swh_lv2
      vmpk # virtual midi keyboard
      x42-avldrums
      x42-gmsynth
      x42-plugins
      zam-plugins # Some random plugins I'm about to try
      zynaddsubfx # Plugin

      # Remove this in favour of `puredata` above once the
      # `fix-jack-client-name-len` patch is merged into the pure data, is
      # published in a new version and the new version is available in nixpkgs.
    #(callPackage /home/mindtree/programming/nix/puredata/puredata.nix {})
    ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
			
