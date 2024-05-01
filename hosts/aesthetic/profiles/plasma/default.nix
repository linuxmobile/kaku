{
  config,
  pkgs,
  ...
}: {
  environment = {
    plasma6.excludePackages =
      (with pkgs.libsForQt5; [
        oxygen
        plasma-browser-integration
      ])
      ++ (with pkgs.kde; [
        plasma-browser-integration
        oxygen
        elisa
        kate
        khelpcenter
      ]);
  };

  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    desktopManager.plasma6 = {
      enable = true;
    };
  };

  programs.dconf.enable = true;
}
