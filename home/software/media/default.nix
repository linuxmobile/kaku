{pkgs, ...}: {
  imports = [
    ./obs.nix
    ./rnnoise.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pamixer
    alsa-utils
  ];
}
