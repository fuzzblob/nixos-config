# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # gitkraken requires unfree
  # TODO: find comfy FLOSS GUI git client
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    packages = with pkgs; [
      vlc
      
      # unfree
      gitkraken
      
      # basics
      zoom-us
      deluge
      keepassxc
      
      #thunderbird
       
      # userland tools for everyone
      # if it was packaged i'd love balenaEtcher
      #alacritty
      #aria2
      #appimage-run
      #appimagetools
      #adb
      #fastboot
    ];
  };
}

