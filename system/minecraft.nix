# minecraft server module; fix modpack
{ pkgs, inputs, ... }:
let
  # Import fetchurl from Nixpkgs
  fetchurl = pkgs.fetchurl;
in
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

        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues{
            FabricAPI = fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/SKPWumQf/fabric-api-0.92.3%2B1.20.1.jar"; sha512 = "073c045791ddf14c28a1ec163e7ef40dcb014a73d72856f881aab04df018e1c62774978c95cda3a07bb324198bd586040e466eabc46bd2f09a16115c7d97e459"; };
            Chalk = fetchurl { url = "https://cdn.modrinth.com/data/OrtjXTCH/versions/AnIA4EcY/chalk-2.2.4.jar"; sha512 = "75d8a61b9d037f8bae30d6694dab4813b5f77fdf20c0bfd7a6ec9d2e25815cc03473b28a0366cbf33eda9bd90070e3d6a442fc051270161741b1924eba201a7e"; };
            UniversalGraves = fetchurl { url = "https://cdn.modrinth.com/data/yn9u3ypm/versions/66RxRZcI/graves-3.0.3%2B1.20.1.jar"; sha512 = "c76d26e1bd0b3ce48c211729662b940b99d3ab5d9661fe007625840152ca064262625090d152eff93e3c4588a4cd33d353c33c31bc111b43f87a71b25f45cba1"; };
            Comforts = fetchurl { url = "https://cdn.modrinth.com/data/SaCpeal4/versions/pMr60Kkq/comforts-fabric-6.4.0%2B1.20.1.jar"; sha512 = "c1796378b47aa03544b772d2b631d7387e4365ba0c0a3468dc5e78348d26e0406bd015b530e0acab679e090310aafd201a106e519d3b9e32b26e0db9928b04be"; };
            BasicWeapons = fetchurl { url = "https://cdn.modrinth.com/data/sc2Pektv/versions/P2kARD78/basicweapons-1.2.5%2B1.20.1.jar"; sha512 = "dc7b5e8facc5072ce59559b33e03b786a61123b469c454db89dd67cda272c0339692841f4afc890ed87546f1b51cadcade6437fd1cb61b9f9de5b6bba45f0fa1"; };
          });
        };
        
        serverProperties = {
          gamemode = "survival";
          difficulty = "hard";
          max-player = 2;
          simulation-distance = 10;
          server-port = 25565;
        };
        
        jvmOpts = "-Xms4092M -Xmx16384M";

      };
      custom2 = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.16.10";};

        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues{
            FabricAPI = fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/SKPWumQf/fabric-api-0.92.3%2B1.20.1.jar"; sha512 = "073c045791ddf14c28a1ec163e7ef40dcb014a73d72856f881aab04df018e1c62774978c95cda3a07bb324198bd586040e466eabc46bd2f09a16115c7d97e459"; };
            Chalk = fetchurl { url = "https://cdn.modrinth.com/data/OrtjXTCH/versions/AnIA4EcY/chalk-2.2.4.jar"; sha512 = "75d8a61b9d037f8bae30d6694dab4813b5f77fdf20c0bfd7a6ec9d2e25815cc03473b28a0366cbf33eda9bd90070e3d6a442fc051270161741b1924eba201a7e"; };
            UniversalGraves = fetchurl { url = "https://cdn.modrinth.com/data/yn9u3ypm/versions/66RxRZcI/graves-3.0.3%2B1.20.1.jar"; sha512 = "c76d26e1bd0b3ce48c211729662b940b99d3ab5d9661fe007625840152ca064262625090d152eff93e3c4588a4cd33d353c33c31bc111b43f87a71b25f45cba1"; };
            Comforts = fetchurl { url = "https://cdn.modrinth.com/data/SaCpeal4/versions/pMr60Kkq/comforts-fabric-6.4.0%2B1.20.1.jar"; sha512 = "c1796378b47aa03544b772d2b631d7387e4365ba0c0a3468dc5e78348d26e0406bd015b530e0acab679e090310aafd201a106e519d3b9e32b26e0db9928b04be"; };
            BasicWeapons = fetchurl { url = "https://cdn.modrinth.com/data/sc2Pektv/versions/P2kARD78/basicweapons-1.2.5%2B1.20.1.jar"; sha512 = "dc7b5e8facc5072ce59559b33e03b786a61123b469c454db89dd67cda272c0339692841f4afc890ed87546f1b51cadcade6437fd1cb61b9f9de5b6bba45f0fa1"; };
            WraithWaystones = fetchurl { url = "https://cdn.modrinth.com/data/sTZr7NVo/versions/DZAntbmD/wraith-waystones-3.3.2%2Bmc1.20.1.jar"; sha512 = "1d7d07e4910670899108a6c4cb570f27dcf0a9502ca477d19be3e0f486e4c0720ef51d4854fed8f7b55823cde63741065aaf6836d849af1ce25e75e54329d999"; };
            owo-lib = fetchurl { url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/zyOBB7J4/owo-lib-0.11.2%2B1.20.jar"; sha512 = "807e4a3daf493e92c5ff0d5657efbba2a4e0cd2a9b753f2d6f153422629415f189345842a6dd258c87d4c02ebf38950a517bcd8a7ed929af6ed6485ae46cf77e"; };
            FallingTree = fetchurl { url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/NrtzFkZE/FallingTree-1.20.1-4.3.4.jar"; sha512 = "487cd36886cb791a3f252c90818d5c1cedeec5080a7f874b0bfafff328c8fcc9b2acee03fe40f8397355e8a2a092d2f34cb40671c786c0d9d035728c971d4e9c"; };
            Sawmill = fetchurl { url = "https://cdn.modrinth.com/data/WRaRZdTd/versions/SSHTQlql/sawmill-1.20-1.4.6-fabric.jar"; sha512 = "47907082925b00c96f23ecf37df1f8e73dd62ad40cb39072b99387c5f8b9723eec721cba07c2c722911c24c81b4b8d581aa0b6370104003746fee188d5dbd6e6"; };
            MoonlightLib = fetchurl { url = "https://cdn.modrinth.com/data/twkfQtEc/versions/Wjdv40t5/moonlight-1.20-2.13.58-fabric.jar"; sha512 = "9cd5c134526ad3c10e0cb679d784368dfcada15f06392049085771ebd08fb09b655ab8305e18668750549aa5acf3ee117756501e075e23a600669c367367591d"; };
            BetterCombat = fetchurl { url = "https://cdn.modrinth.com/data/5sy6g3kz/versions/qxfX3jsR/bettercombat-fabric-1.8.6%2B1.20.1.jar"; sha512 = "be6f596a3466263559a32c29cf524084961ae3912401960f65fcd0b701854941c78a053a21b22abb10f858e150cc73a76810e0f7c3b9fbca8860c80ecd25273c"; };
            Gliders = fetchurl { url = "https://cdn.modrinth.com/data/XiC6HzoU/versions/FTfjUzVu/gliders-fabric-1.1.6.jar"; sha512 = "9e07dc75799db7bf62ba9a68870fb787c0eba0b1ba286ebdbdb18b29bbe7413b8551be3318f4cbf897c3babaf3ce80bef4f88bce4d965cf52cb74e5b7eea9d4c"; };
            FarmersDelight = fetchurl { url = "https://cdn.modrinth.com/data/7vxePowz/versions/iVLPoC2e/FarmersDelight-1.20.1-2.2.5%2Brefabricated.jar"; sha512 = "b75217f91745153ed4e66a43bd69a41bab6836b62e60c69ebb717c51aa9e708d2bfbde985bcf21a7d666635bf0182da5ae80cba7f3d15851f63c6a099c35d26d"; };
            valkyrienskies = fetchurl { url = "https://cdn.modrinth.com/data/V5ujR2yw/versions/wDYLclLS/valkyrienskies-120-2.3.0-beta.5.jar"; sha512 = "acc6a13e788768d54c9fdeb4da6f5112acbe6a11cb5f9f08f6792400e350af3c55eb18347f1f99b1c6a8ae1a1085856ebc23c51c1f1c5f60fb5b693255be20ad"; };
            eureka = fetchurl { url = "https://cdn.modrinth.com/data/EO8aSHxh/versions/sXx5EPib/eureka-1201-1.5.1-beta.3.jar"; sha512 = "614b47e312cf7a8d2aaa6f005e805a3ca35347123552d442d3b4d36ac3304bda2a85ef3823300eae0d6b66e35a10f0345ac44654bea6bd24a0e1be78196f2869"; };
          });
        };
        
        serverProperties = {
          gamemode = "creative";
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
