{ inputs', lib, pkgs, self', ... }: {
  imports = [ ./config.nix ];

  home.packages = with pkgs; [
    seatd
    jaq
    xorg.xprop
    inputs'.hyprland-contrib.packages.grimblast
    self'.packages.xwaylandvideobridge
  ];

  # start swayidle as part of hyprland, not sway
  systemd.user.services.swayidle.Install.WantedBy =
    lib.mkForce [ "hyprland-session.target" ];

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;

  home.file.".config/hypr/scripts/volume" = {
    source = ./scripts/volume;
    executable = true;
  };
  home.file.".config/hypr/scripts/screensht" = {
    source = ./scripts/screensht;
    executable = true;
  };
  home.file.".config/hypr/scripts/colorpicker" = {
    source = ./scripts/colorpicker;
    executable = true;
  };
}
