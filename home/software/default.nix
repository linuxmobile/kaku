{pkgs, ...}: {
  imports = [
    ./browsers/chromium.nix
    ./browsers/edge.nix
    # ./browsers/qutebrowser.nix
    ./browsers/zen.nix
    ./gtk.nix
    ./media
  ];

  home.packages = with pkgs; [
    # messaging
    telegram-desktop
    vesktop

    # misc
    pciutils
    nixos-icons
    colord
    cliphist
    ffmpegthumbnailer
    imagemagick
    nodejs
    nodePackages.pnpm
    bun

    fastfetch

    # gnome
    amberol
    (celluloid.override {youtubeSupport = true;})
    dconf-editor
    file-roller
    loupe
    (papers.override {supportNautilus = true;})
    resources

    inkscape
    gimp
    # krita
    scrcpy
    multiviewer-for-f1

    swww
    ghostty
    mods
  ];
}
