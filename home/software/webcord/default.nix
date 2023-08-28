{ pkgs, lib, ... }:
with lib;
let
  rosepine-theme = pkgs.fetchFromGitHub {
    owner = "linuxmobile";
    repo = "discord-rosepine";
    rev = "d7d428f67ae1594a55634df6fde7c324d49b0857";
    hash = "sha256-cx2KMH2SCTCmvGOLBooucR6EaryBf3O+4VC/lsAX+cE=";
  };
in {
  home.packages = with pkgs;
    [
      webcord-vencord # webcord with vencord extension installed
    ];

  xdg.configFile = {
    "WebCord/Themes/rosepine" = {
      source = "${rosepine-theme}/rosepine.theme.css";
    };

    # # share my webcord configuration across devices
    # "WebCord/config.json".source = config.lib.file.mkOutOfStoreSymlink "./config.json";
  };
}
