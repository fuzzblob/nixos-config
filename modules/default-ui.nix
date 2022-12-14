# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # path-tofile.nix
      ./apps-gui.nix
      ./apps-system.nix
      ./default-users.nix
      ./cinnamon.nix
      #./gnome.nix
      ./harden.nix
      ./locale.nix
      ./networking.nix
    ];
  
  # nix config goes here
  
  # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      #"* * */1 * *      root    date >> /tmp/cron.log"
    ];
  };
}

