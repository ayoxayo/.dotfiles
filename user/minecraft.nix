{ pkgs, lib, inputs, ... }:

#let
#  serverModpack = (pkgs.fetchPackwizModpack {
#    url = "https://raw.githubusercontent.com/ayoxayo/custom1/refs/heads/main/pack.toml";
#    packHash = "sha256-14gg8crd1ykbiygcdp4160yc1si6i0ksmi9q0rzfgry999sygg1n";
#  });
#in

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    
    servers = {

      vanillaCreative = {
        enable = true;
        autoStart = false;
        package = pkgs.vanillaServers.vanilla-1_21_4;

        serverProperties = {
          gamemode = "creative";
          difficulty = "hard";
          max-player = 2;
          simulation-distance = 10;
          server-port = 25565;
        };
        
        jvmOpts = "-Xms4092M -Xmx16384M";
        
       #whitelist = {
        #   SketchyChef = "899e132a-59a3-4169-b537-f3571ed91fae";
        #};
      };

      vanillaSurvival = {
        enable = true;
        autoStart = false;
        package = pkgs.vanillaServers.vanilla-1_21_4;

        serverProperties = {
          gamemode = "survival";
          difficulty = "hard";
          max-player = 2;
          simulation-distance = 10;
          server-port = 25565;
        };
        
        jvmOpts = "-Xms4092M -Xmx16384M";
      };

      custom1 = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.16.10";};

        #        symlinks = {
        #"mods" = "${serverModpack}/mods";
        #};
        
        serverProperties = {
          gamemode = "survival";
          difficulty = "hard";
          max-player = 2;
          simulation-distance = 10;
          server-port = 25565;
        };
        
        jvmOpts = "-Xms4092M -Xmx16384M";

      };
    };
  };
}
