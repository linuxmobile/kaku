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
    font = "CartographCF Nerd Font";
    name = "wezterm";
    opacity = 0.9;
    size = 9;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://i.imgur.com/8Elk2Pv.png";
    sha256 = "1yv64hmv1l95nf20nbkwab8ixgzsimb4grqk07rq0bvsidh8qjxh";
  };
}
