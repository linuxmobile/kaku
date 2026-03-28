{pkgs, ...}: {
  imports = [
    ./mpv.nix
    ./obs.nix
    ./rnnoise.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pamixer
    alsa-utils
    easyeffects
  ];
}
