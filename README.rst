.. role:: bash(code)
   :language: bash

==================
NixOS MCPELauncher
==================

MCPELauncher-client wrapped in a Nix flake

-----
Usage
-----

Make sure your system has flake support:


.. code:: nix

  {
    nix = {
      package = pkgs.nixUnstable;

      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
  }
  
Then clone the repository and run :bash:`nix build`, once complete you should have a result folder which symlinks to a script 
in the nix store which you can run to start the launcher.

----------------
Platform Support
----------------

Nix-Darwin is a no go.

Supports all platforms by the launcher:

- x86_64
- i386
- arm
- arm64
