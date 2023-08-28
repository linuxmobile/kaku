{ pkgs, ... }:
# media - control and enjoy audio/video
{
  imports = [ ./rnnoise.nix ./spicetify.nix ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pamixer
    # images
    imv

    # spotify
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
  };

  services = { playerctld.enable = true; };
}
