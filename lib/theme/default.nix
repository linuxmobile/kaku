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
    url = "https://i.postimg.cc/nHgTxD3L/IMG-20230317-222628.png";
    sha256 = "sha256-UUKSyOFC7M+cqK/YiItWLp0Myp3IIJOadr5i+eE3COw=";
  };
}
