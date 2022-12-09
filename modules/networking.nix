# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  networking.hostName = "t540p"; # Define your hostname.
  
  # Networking
  networking = {
    networkmanager = {
      # Enable networking
      enable = true;
      ethernet.macAddress = "stable";
      #insertNameservers = [];
    
      # Radios
      wifi.macAddress = "stable";
      wifi.powersave = true;
      wifi.scanRandMacAddress = true;
    };

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    useDHCP = lib.mkDefault true;
    # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;
    };

    wireless.userControlled.enable = true;
    wireless.networks = {
      "free.wifi" = {}; # Public wireless network
    };

    firewall = {
      networking.firewall.enable = true;
      # 631 IPP - printer discovery
      
      # Open ports in the firewall.
      #allowedUDPPorts = [ 631 ];
      #allowedTCPPorts = [ 631 ];
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}

