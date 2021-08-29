{
  description = "MCPE Launcher for Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = 
      with import nixpkgs { system = "x86_64-linux"; };

      appimageTools.wrapType2 {
        name = "mcpe-launcher";

        src = fetchurl {
          url = "https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/v0.2.5-672/Minecraft_Bedrock_Launcher-x86_64-0.0.672.AppImage";
          sha256 = "sha256-qGWi0diAPYJoxnyzAwkOm1Ojki26BGgvYX1cBO+ji6g=";
        };
      };
  };
}
