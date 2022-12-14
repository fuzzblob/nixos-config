# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #vim
    nano
    git
    #neofetch

    # a web browser is also very useful
    # replace firefox with freer version
    librewolf
    
    # general admin
    htop
    gparted
    #kate
    #parted
    #gnome3.gnome-disk-utility
    
    # file analysis
    #gdu
    #duc
    #fdupes
    #baobab
  ];
}

