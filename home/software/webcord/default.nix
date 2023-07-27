{
  pkgs,
  lib,
  inputs,
  osConfig,
  ...
}:
with lib; let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "0f2c393b11dd8174002803835ef7640635100ca3";
    hash = "sha256-iUnLLAQVMXFLyoB3wgYqUTx5SafLkvtOXK6C8EHK/nI=";
  };

  device = osConfig.modules.device;
  video = osConfig.modules.system.video;
  acceptedTypes = ["desktop" "laptop" "hybrid"];
in {
  imports = [
    inputs.arrpc.homeManagerModules.default
  ];

  config = mkIf ((builtins.elem device.type acceptedTypes) && (video.enable)) {
    home.packages = with pkgs; [
      webcord-vencord # webcord with vencord extension installed
    ];

    xdg.configFile = {
      "WebCord/Themes/mocha" = {
        source = "${catppuccin-mocha}/themes/mocha.theme.css";
      };

      # share my webcord configuration across devices
      # "WebCord/config.json".source = config.lib.file.mkOutOfStoreSymlink "${self}/home/notashelf/graphical/apps/webcord/config.json";
    };

    services.arrpc.enable = true;
  };
}
