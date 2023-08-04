{ pkgs, self', ... }: {
  home.packages = with pkgs; [
    # messaging
    tdesktop
    self'.packages.inkdrop

    pavucontrol
    neovim-unwrapped
    vscode
    brave
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
    cargo
    gcc
    nodejs
    nodePackages.pnpm

    glow
    # libsixel # image support for foot

    neofetch
    gnome.file-roller

    # nvim servers
    nixfmt
    rnix-lsp
    deno
  ];
}
