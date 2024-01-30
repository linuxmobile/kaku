{pkgs, ...}: {
  imports = [
    ./obs.nix
    ./rnnoise.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    pamixer
    alsa-utils

    # images
    viewnior

    # music
    termusic
  ];
}
