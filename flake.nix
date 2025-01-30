{
  description = "Home-manager with solaar and plasma-manager, home-manager and nix-minecraft and nvf";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-24.05";
    # use the following for unstable:
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
     solaar = {
     url = "github:Svenum/Solaar-Flake/main";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, solaar, nvf, ... }@inputs:
    let
      lib = nixpkgs.lib;
      username = "igor";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = {inherit inputs;};
          modules = [
            solaar.nixosModules.default
            ./configuration.nix


            # plasma-manager attempt
            home-manager.nixosModules.home-manager
            {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            }
          ];
        };
    };
    homeConfigurations = {
        igor = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.plasma-manager.homeManagerModules.plasma-manager
            nvf.homeManagerModules.default
            ./home.nix 
          ];
        };
      };
  };
}
