# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  programs.sway.enable = true;
  # enable screensharing
  xdg.portal.wlr.enable = true;

  environment.systemPackages = with pkgs; [
    # login deamons:
    wlgreet

    # launchers:
    ulauncher
    # sirula

    wob
    wdisplays
    waybar
    wlogout
    #wofi
    #wofi-emoji
    #rofi
    #swaynotificationcenter
  ];
}

