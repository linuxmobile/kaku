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
    exec = "start"; # command used to execute programs
    opacity = 0.9;
    size = 10;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://i.imgur.com/5WKwB1q.jpg";
    sha256 = "sha256:054kfavfjfcxnk9fw270knwlw4smr7350dj7d18pxs9b9dnk2q7d";
  };
}
