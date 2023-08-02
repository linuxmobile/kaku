{ config, lib, ... }:
# networking configuration
{
  networking = {
    dhcpcd.enable = true;
    # networkmanager = {
    #   enable = true;
    #   dns = "systemd-resolved";
    #   wifi.powersave = true;
    # };
  };
  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };
    # DNS resolver
    resolved.enable = true;
  };
}
