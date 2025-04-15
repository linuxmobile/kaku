{
  inputs,
  lib,
  pkgs,
  ...
}: {
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      gwenview
      kate
      khelpcenter
      konsole
      kwallet
      kwalletmanager
      kwallet-pam
      okular
      oxygen
      plasma-browser-integration
      xwaylandvideobridge
      baloo
      baloo-widgets
      plasma-browser-integration
      krdp
      qtvirtualkeyboard
      flatpak-kcm
      discover
      plasma-thunderbolt
      wacomtablet
    ];
    systemPackages = with pkgs; [
      kdePackages.qtstyleplugin-kvantum
      kdePackages.sddm-kcm
      kdePackages.qt6ct
      kde-rounded-corners
      inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
      inputs.ghostty.packages.${pkgs.system}.default

      # apps
      amberol
      cavalier
      (celluloid.override {youtubeSupport = true;})
      easyeffects
      keypunch
      loupe
      resources

      wl-clipboard
    ];
  };

  services = {
    xserver.enable = false;
    xserver.desktopManager.xterm.enable = lib.mkForce false;
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

  programs = {
    dconf.enable = true;
  };
}
