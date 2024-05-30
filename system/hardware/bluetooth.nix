{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    settings = {
      General = {
        MultiProfile = "multiple";
        Experimental = true;
        FastConnectable = true;
      };
    };
  };
}
