{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./anyrun
    ./browsers/brave.nix
    ./browsers/edge.nix
    ./browsers/firefox.nix
    ./browsers/qutebrowser.nix
    ./gtk.nix
    ./media
  ];

  home.packages = with pkgs; [
    # messaging
    tdesktop
    vesktop

    # misc
    ps_mem
    pciutils
    nixos-icons
    colord
    ffmpegthumbnailer
    imagemagick
    cliphist
    nodejs
    nodePackages.pnpm
    catimg
    bun

    # gnome
    gnome.nautilus
    gnome.file-roller
    amberol
    blanket
    cavalier
    celluloid
    contrast
    eyedropper
    gnome-solanum
    keypunch
    kooha
    loupe
    overskride
    paleta
    paper-plane
    papers
    parabolic
    planify
    pwvucontrol
    resources

    inkscape
    gimp
    scrcpy
  ];
}
