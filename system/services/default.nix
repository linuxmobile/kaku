{
  lib,
  pkgs,
  ...
}: {
  services = {
    printing = {
      enable = true;
      drivers = [pkgs.hplip];
    };

    dbus.implementation = "broker";

    irqbalance.enable = true;
    thermald.enable = true;
    speechd.enable = lib.mkForce false;
  };

  # Use in place of hypridle's before_sleep_cmd, since systemd does not wait for
  # it to complete
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
    powerDownCommands = ''
      # Lock all sessions
      loginctl lock-sessions

      # Wait for lockscreen(s) to be up
      sleep 1
    '';
  };
}
