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
    ./tools/vencord.nix
  ];

  home.packages = with pkgs; [
    # messaging
    tdesktop

    ps_mem

    vesktop

    # misc
    pciutils
    nixos-icons
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
