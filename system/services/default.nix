_: {
  services = {
    dbus.implementation = "broker";
    printing.enable = true;

    # profile-sync-daemon
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
    irqbalance.enable = true;
  };
}
