{pkgs, ...}: {
  imports = [
    ./mpv.nix
    ./obs.nix
    ./rnnoise.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    pamixer
    alsa-utils

    # audio
    amberol
    termusic
    blanket

    # images
    loupe

    # videos
    celluloid
  ];
}
