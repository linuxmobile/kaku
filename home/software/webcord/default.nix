{ pkgs, lib, inputs, ... }:
with lib;
let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "4ad2a3886992fec64ad5e2a99f97c101e82f819d";
    hash = "sha256-i06KaxGIEX4DcF0EguQrHNfHVIWXi6BMLxvFThcfSys=";
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
