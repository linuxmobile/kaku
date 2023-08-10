{ pkgs, lib, inputs, ... }:
with lib;
let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "c04f4bd43e571c19551e0e5da2d534408438564c";
    hash = "sha256-3uEVrR2T39Pj0puUwUPuUfXcCPoOq2lNHL8UpppTOiU=";
  };
in {
  home.packages = with pkgs;
    [
      webcord-vencord # webcord with vencord extension installed
    ];

  xdg.configFile = {
    "WebCord/Themes/mocha" = {
      source = "${catppuccin-mocha}/themes/mocha.theme.css";
    };

    # # share my webcord configuration across devices
    # "WebCord/config.json".source = config.lib.file.mkOutOfStoreSymlink "./config.json";
  };
}
