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
    opacity = 1.0;
    size = 9;
  };

  # TODO: Change this later
  wallpaper = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/linuxmobile/hyprland-dots/Sakura/.wallpapers/catgirl.jpg";
    sha256 = "sha256-5ON6GQ1yEFF/6ChUVgWAlLO9PnvGEBfGOeyOcWlGMlM=";
  };
}
