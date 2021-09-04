{
  description = "MCPE Launcher for Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";

    flake-utils.url = "github:numtide/flake-utils";
    
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system}; 
        arch = nixpkgs.lib.removeSuffix "-linux" "${system}";
      in rec {
        defaultPackage = with pkgs; appimageTools.wrapType2 {
          name = "minecraft-linux";

          src = fetchurl {
            url = "https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.2.5-672/Minecraft_Bedrock_Launcher-${arch}-0.0.672.AppImage";
            sha256 = "sha256-qGWi0diAPYJoxnyzAwkOm1Ojki26BGgvYX1cBO+ji6g=";
          };
        };
      }
    );
}
