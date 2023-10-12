{
  pkgs,
  lib,
  default,
  ...
}:
with lib; let
  waybar_config = import ./config.nix {};
  waybar_style = import ./style.nix {inherit default;};
in {
  home.packages = with pkgs; [python39Packages.requests];
  programs.waybar = {
    enable = true;
    settings = waybar_config;
    style = waybar_style;
  };
}
