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
    # specific to unsplash
    wallpaper = builtins.fetchurl {
      url = "https://i.imgur.com/5WKwB1q.jpg";
      sha256 = "sha256:054kfavfjfcxnk9fw270knwlw4smr7350dj7d18pxs9b9dnk2q7d";
    };
  };

  programs.matugen = {
    enable = false;
    wallpaper = config.theme.wallpaper;
  };
}
