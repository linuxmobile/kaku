{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./browsers/brave.nix
    ./browsers/firefox.nix
    ./media
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    # messaging
    tdesktop

    xfce.thunar
    xfce.thunar-archive-plugin
    ps_mem

    vesktop
    discordo

    # misc
    colord
    ffmpegthumbnailer
    imagemagick
    xfce.tumbler
    xdotool
    cliphist
    rizin
    xcolor
    nodejs
    nodePackages.pnpm
    jq
    socat
    catimg
    bun

    gnome.file-roller
  ];
}
