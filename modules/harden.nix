{ pkgs, ... }: {

  security.sudo.execWheelOnly = true;

  security.auditd.enable = true;
  security.audit.enable = true;

  services = {
    openssh = {
      enable = false;
      # investigate enabling these for ssh
      #permitRootLogin = "prohibit-password";
      #passwordAuthentication = false;
      allowSFTP = false;
    };
    fail2ban = {
      enable = true;
      ignoreIP = [
      ];
    };
  };
  #nix.settings.allowed-users = [ "root" "srid" ];
  #nix.settings.trusted-users = [ "root" "srid" ];
}
