{
  description = "MCPE Launcher for Linux";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system}; 
        arch = nixpkgs.lib.removeSuffix "-linux" "${system}";
      in rec {
        defaultPackage = with pkgs; appimageTools.wrapType2 {
          name = "mcpelauncher-client";

          src = fetchurl {
            url = "https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.2.5-672/Minecraft_Bedrock_Launcher-${arch}-0.0.672.AppImage";
            sha256 = "sha256-qGWi0diAPYJoxnyzAwkOm1Ojki26BGgvYX1cBO+ji6g=";
          };
        };
      }
    );
}
