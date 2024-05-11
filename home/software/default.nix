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
    inputs.self.packages.${pkgs.system}.discordo

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

    gnome.nautilus
    gnome.file-roller
    contrast
    paleta
    paper-plane
    resources

    inkscape
    gimp
    scrcpy
  ];
}
