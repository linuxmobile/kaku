{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    sassc
    swww
    inotify-tools
  ];
  programs.ags.enable = true;
}
