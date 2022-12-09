# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# reboot 3

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # replace with programs.sway.enable = true;
  services.xserver = {
      enable = true;
      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;
      #libinput.tapping = false;
      #libinput.tappingDragLock = false;

      # Configure keymap in X11
      layout = "us";
      # xkbOptions = "eurosign:e";
    };

  # Enable the Cinnamon Desktop Environment.
  services.cinnamon.apps.enable = true;
  # meaning following pakages:
  # mint-meta-cinnamon baobab blueberry cinnamon cinnamon-common cinnamon-control-center cinnamon-desktop-data cinnamon-screensaver cinnamon-settings-daemon file-roller firefox gcr gdebi geoclue-2.0 gimp gnome-bluetooth gnome-calculator gnome-calendar gnome-disk-utility gnome-font-viewer gnome-logs gnome-power-manager gnome-screenshot gnome-system-monitor gnome-terminal gparted gucharmap gufw hexchat im-config libreoffice-base libreoffice-calc libreoffice-common libreoffice-draw libreoffice-impress libreoffice-math libreoffice-writer lightdm-settings mint-artwork mintbackup mintdrivers mintinstall mintlocale mintreport mintsources mintstick mintupdate mintwelcome muffin nemo network-manager-gnome onboard openjdk-11-jre pix printer-driver-foo2zjs-common python2.7 python3.6 qt5ct redshift redshift-gtk rhythmbox seahorse simple-scan synaptic system-config-printer thunderbird timeshift tomboy transmission-gtk ubiquity-frontend-gtk ubuntu-system-adjustments vim-common xdg-desktop-portal-gtk xed xplayer xreader xviewer yelp

  services.xserver = {
    displayManager.lightdm.enable = true;
    #displayManager.autoLogin.enable = true;
    #displayManager.autoLogin.user = "user";

    desktopManager.cinnamon.enable = true;
  };
}

