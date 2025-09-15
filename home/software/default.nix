{pkgs, ...}: {
  imports = [
    ./browsers/chromium.nix
    ./browsers/edge.nix
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
    scrcpy
    multiviewer-for-f1

    ghostty
    mods
  ];
}
