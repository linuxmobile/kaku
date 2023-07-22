{
  colorlib,
  lib,
}: rec {
  colors = import ./colors.nix;
  # #RRGGBB
  xcolors = lib.mapAttrs (_: colorlib.x) colors;
  # rgba(,,,) colors (css)
  rgbaColors = lib.mapAttrs (_: colorlib.rgba) colors;

  browser = "brave";

  launcher = "anyrun";

  # linuxmobile font -> AestheticIosevka Nerd Font Mono
  terminal = {
    font = "AestheticIosevka Nerd Font Mono";
    name = "wezterm";
    opacity = 0.9;
    size = 10;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl rec {
    name = "${sha256}-9O1MjRQ.png";
    url = "https://i.imgur.com/";
    sha256 = "0v6hjnvfgcimip95m9gj1jfaqmza978qpxl0sgbbvkqn5qhsan1m";
  };
}
