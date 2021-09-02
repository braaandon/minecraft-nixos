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
          name = "mcpelauncher-client";

          src = fetchurl {
            url = "https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.2.1-hook-2-663/Minecraft_Bedrock_Launcher-${arch}-0.0.663.AppImage";
            sha256 = "sha256-9TkGMm8BjKpJJ9s5/oT4KT7WtU3ypkVr9QIsQnQMDe4=";
          };
        };
      }
    );
}
