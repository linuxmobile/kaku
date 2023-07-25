{pkgs, self', ...}: {
  home.packages = with pkgs; [
    # messaging
    tdesktop
    discord
    webcord

    pavucontrol
    neovim-unwrapped
    vscode
    brave
    betterdiscordctl
    xfce.thunar
    xfce.thunar-archive-plugin

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
    # libsixel # image support for foot

    neofetch
    gnome.file-roller
  ];
}
