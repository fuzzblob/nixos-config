# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # path-tofile.nix
      networking.nix
      locale.nix
      apps-system.nix
      apss-gui.nix
      user.nix
      gnome.nix
    ];
  
  # nix config goes here
}

