# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.luks.devices."luks-3634e2b4-5daf-47b9-a0c3-f18b20d653c2".device = "/dev/disk/by-uuid/3634e2b4-5daf-47b9-a0c3-f18b20d653c2";
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e789161e-f0a9-43e3-b22b-e2ad6020b17e";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/7374-A396";
      fsType = "vfat";
    };

  boot.initrd.luks.devices."luks-5dcee301-7bfb-4987-8807-db796ba10b00".device = "/dev/disk/by-uuid/5dcee301-7bfb-4987-8807-db796ba10b00";
  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/36233c30-f122-46a8-b102-b1a6d6d61991";
      fsType = "btrfs";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
