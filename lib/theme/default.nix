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
    font = "Maple Mono SC NF";
    name = "foot";
    opacity = 0.9;
    size = 10;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://i.imgur.com/qZZkdDs.jpg";
    sha256 = "sha256:1wzid1kzl4crzd5jn6nypqafkh48z2xzm6cpx145zmj6k6p1pish";
  };
}
