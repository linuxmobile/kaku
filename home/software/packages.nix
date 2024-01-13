{pkgs, ...}: {
  home.packages = with pkgs; [
    # messaging
    tdesktop

    betterdiscordctl
    xfce.thunar
    xfce.thunar-archive-plugin
    ps_mem

    vesktop
    youtube-tui

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
    htop
    nodejs
    nodePackages.pnpm
    jq
    socat
    catimg
    bun

    neofetch
    gnome.file-roller
    scrcpy

    gcc
    nixfmt
    rnix-lsp
    cargo
  ];
}
