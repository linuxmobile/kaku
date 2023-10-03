{
  default,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = let
      inherit (default) xcolors;
    in {
      clock = true;
      font = "Jost *";
      image = default.wallpaper;
      indicator = true;
      effect-blur = "10x2";
      color = "#0c0e0f4d";

      bs-hl-color = xcolors.color4;
      key-hl-color = xcolors.foreground;
      separator-color = xcolors.background;
      text-color = xcolors.background;

      inside-color = xcolors.color4;
      line-color = xcolors.color4;
      ring-color = xcolors.background;

      inside-clear-color = xcolors.color3;
      line-clear-color = xcolors.color3;
      ring-clear-color = xcolors.background;

      inside-ver-color = xcolors.color4;
      line-ver-color = xcolors.color4;
      ring-ver-color = xcolors.background;

      inside-wrong-color = xcolors.color4;
      line-wrong-color = xcolors.color4;
      ring-wrong-color = xcolors.background;
    };
  };
}
