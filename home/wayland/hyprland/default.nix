{
  inputs',
  lib,
  pkgs,
  self',
  ...
}: {
  imports = [./config.nix];

  home.packages = with pkgs; [
    seatd
    jaq
    xorg.xprop
    inputs'.hyprland-contrib.packages.grimblast
    self'.packages.xwaylandvideobridge
  ];

  # start swayidle as part of hyprland, not sway
  systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];

  # enable hyprland
  wayland.windowManager.hyprland.enable = true;
}
