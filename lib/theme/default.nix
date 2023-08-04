{ colorlib, lib, }: rec {
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
    opacity = 0.7;
    size = 9;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/redyf/wallpapers/main/lofi.gif";
    sha256 = "sha256-0FUN4tfsHTdWymBtLzSUJq0701f9Ia5tdPyN7MxHwVY=";
  };
}
