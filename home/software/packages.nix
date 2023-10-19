{pkgs, ...}: {
  home.packages = with pkgs; [
    # messaging
    tdesktop

    pavucontrol
    betterdiscordctl
    xfce.thunar
    xfce.thunar-archive-plugin
    ps_mem

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

    # nvim servers
    # nixfmt
    # rnix-lsp
    # deno
  ];
}
