{lib, ...}:
# networking configuration
{
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };
    gnome.glib-networking.enable = true;

    # DNS resolver
    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
    };
  };

  # Don't wait for network startup
  # systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
