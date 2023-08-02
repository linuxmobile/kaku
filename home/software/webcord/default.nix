{ pkgs, lib, inputs, ... }:
with lib;
let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "0f2c393b11dd8174002803835ef7640635100ca3";
    hash = "sha256-iUnLLAQVMXFLyoB3wgYqUTx5SafLkvtOXK6C8EHK/nI=";
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
