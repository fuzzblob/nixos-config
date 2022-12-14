# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# reboot 3

{ config, pkgs, ... }:

{
  # Default user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.user = {
      description = "user";
      isNormalUser = true;
      
      # hint: legacy
      initialHashedPassword = "$y$j9T$TudrxCe7f.rPWtmEV8aIA0$Kpsuy1CnS7.HLCY7afG8P5Dc9yIRqfuVBCIpB/1Qt7B";
      
      home = "/home/user";
      extraGroups = [
        "wheel" # enable sudo
        "networkmanager" # enable networking configureation
        # "dialout"	# enable serial console
        # "vboxusers"	# enable virtual box
        # "docker"	# enable docker
        # "lxd"		# enable lxd
      ];
    };
  };

  environment.interactiveShellInit = ''
    alias ..='cd ..'
    alias l='ls -alh'
    alias ll='ls -l'
    alias ls='ls --color=tty'
  '';
}

