{pkgs, ...}: {
  home.packages = with pkgs; [
    # messaging
    tdesktop

    xfce.thunar
    xfce.thunar-archive-plugin
    ps_mem

    vesktop
    discordo

    # misc
    libnotify
    xdg-utils
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

    neofetch
    gnome.file-roller
  ];
}
