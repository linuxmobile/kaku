{pkgs, ...}: {
  home.packages = with pkgs; [
    # messaging
    tdesktop

    pavucontrol
    neovim-unwrapped
    vscode
    brave
    betterdiscordctl
    xfce.thunar
    xfce.thunar-archive-plugin
    ps_mem
    figma-linux
    figma-agent

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
    jq
    socat
    mpc-cli
    mpdris2
    catimg

    glow
    libratbag
    piper
    # libsixel # image support for foot

    neofetch
    gnome.file-roller

    # nvim servers
    nixfmt
    rnix-lsp
    deno
  ];
}
