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
      url = "https://i.imgur.com/mNDXG6G.jpeg";
      sha256 = "sha256-0MCQD//ATUUkyPWVJZu6db7mqS0Wm6mkVpaqVs/s9qA=";
    };
  };

  programs.matugen = {
    enable = false;
    wallpaper = config.theme.wallpaper;
  };
}
