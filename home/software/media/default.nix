{pkgs, ...}: {
  imports = [
    ./mpv.nix
    ./obs.nix
    ./rnnoise.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pwvucontrol
    pamixer
    alsa-utils

    # music
    termusic
  ];
}
