# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# reboot 3

{ config, pkgs, ... }:

{
  # optimize store to save space
  nix.autoOptimiseStore = true;

  # Use the systemd-boot EFI boot loader.
  boot = { 
      kernelParams = [
          # "intel_pstate=e=disable" to the listfor TLP
          "intel_pstate=disable"
        ];
    };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # hardware specific packages
    vdpauinfo # intel video
  ];

  # video acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    # vulkan driver support
    driSupport = true;
    # For 32 bit applications & Steam
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better >
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime
    ];
  };

  #services.thinkfan.enable = true;

  # Networking
  networking = {
    hostName = "nixos-testbox"; # Define your hostname.

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.enp2s0.useDHCP = true;
    interfaces.wlp3s0.useDHCP = true;
  };

  networking = {
  };

  # bluetooth
  hardware.bluetooth.enable = true;

  # battery management
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

        # Refer to the output of tlp-stat -p to determine the active scali>
        # https://linrunner.de/tlp/settings/processor.html#cpu-scaling-min>
        CPU_SCALING_MIN_FREQ_ON_AC = 800000;
        CPU_SCALING_MAX_FREQ_ON_AC = 2600000;
        CPU_SCALING_MIN_FREQ_ON_BAT = 800000;
        CPU_SCALING_MAX_FREQ_ON_BAT = 1800000;
      };
    };
}

