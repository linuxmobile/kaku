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
  # wallpaper = builtins.fetchurl rec {
  #   name = "wallpaper-${sha256}.png";
  #   url = "~/.wallpapers/gwen";
  #   sha256 = "1xngx610skv1vqzx1c7j2zv5cg3gld3hkcxki8jd30rssjjx98p2";
  # };
}
