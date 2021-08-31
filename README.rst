.. role:: bash(code)
   :language: bash

==================
NixOS MCPELauncher
==================

MCPELauncher-client wrapped in a Nix flake

There are two branches

* master - Latest release of MCPELauncher-client
* hooking - MCPELauncher-client with hooking functionality (unstable)

----
Demo
----

.. image:: demo.gif

-------------
Local Install
-------------

Run :bash:`git clone https://github.com/staccato/mcpe-nixos` then :bash:`nix-env -if .` in the repository directory

--------------
System Install
--------------

Add this to your flake.nix

.. code:: nix

  {
    inputs.mcpe-nixos.url = "github:staccato/mcpe-nixos";
  }

Add this to your NixOS configuration.nix

.. code:: nix

  { inputs, ... }

  {
    environment.systemPackages = {
      inputs.mcpe-linux.defaultPackage.<platform>
    };
  }

----------------
Platform Support
----------------

Nix-Darwin is a no go.

Supports all platforms by the launcher:

- x86_64
- i386
- arm
- arm64
