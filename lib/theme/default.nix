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
    name = "wezterm";
    opacity = 0.9;
    size = 9;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://i.imgur.com/WbYhvjQ.jpg";
    sha256 = "sha256-FFxY0UF5tD32uV08G+YDSCKrAKz4vEFGMryNY6S17pY=";
  };
}
