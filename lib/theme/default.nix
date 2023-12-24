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
    exec = "start"; # command used to execute programs
    opacity = 0.9;
    size = 10;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://i.imgur.com/s8MR4o3.jpg";
    sha256 = "sha256:00gf7ainxfiymghyfgj8hwkjfbk2sr49n6mhsh6kjmzvyhkf377i";
  };
}
