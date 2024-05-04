{
  pkgs,
  lib,
  config,
  ...
}: {
  # light/dark specialisations
  specialisation = let
    colorschemePath = "/org/gnome/desktop/interface/color-scheme";
    dconf = "${pkgs.dconf}/bin/dconf";

    dconfDark = lib.hm.dag.entryAfter ["dconfSettings"] ''
      ${dconf} write ${colorschemePath} "'prefer-dark'"
    '';
    dconfLight = lib.hm.dag.entryAfter ["dconfSettings"] ''
      ${dconf} write ${colorschemePath} "'prefer-light'"
    '';
  in {
    light.configuration = {
      theme.name = "light";
      home.activation = {inherit dconfLight;};
    };
    dark.configuration = {
      theme.name = "dark";
      home.activation = {inherit dconfDark;};
    };
  };

  theme = {
    wallpaper = builtins.fetchurl {
      url = "https://i.imgur.com/z5gvgwP.jpeg";
      sha256 = "sha256-cQScI9mm4b9lyPX59jbqawqKXrHyAXIVrRWRk3f0LXQ=";
    };
  };

  programs.matugen = {
    enable = false;
    wallpaper = config.theme.wallpaper;
  };
}
