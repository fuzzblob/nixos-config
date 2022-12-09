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
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      # replace with freer version
      #librewolf
      vlc
      # unfree
      gitkraken
      # basics
      #zoom-us
      #deluge
      keepassxc
      #thunderbird
    ];
  };
}

