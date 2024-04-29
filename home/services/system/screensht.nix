{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.sss.nixosModules.home-manager
  ];

  programs.sss = {
    enable = true;

    # General Config
    general = let
      xcolors = pkgs.lib.colors.xcolors config.programs.matugen.theme.colors;
      variant = config.theme.name;
      c = xcolors.colors.${variant};
    in {
      author = " linuxmobile";
      # copy = true;
      colors = {
        background = c.on_secondary_fixed;
        author = c.secondary;
        shadow = c.background;
      };
      fonts = "GeistMono Nerd Font=11.0";
      radius = 8;
      save-format = "webp";
      shadow = true;
      shadow-image = true;
    };
  };
}
