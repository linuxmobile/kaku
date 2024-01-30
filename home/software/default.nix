{pkgs, inputs, ...}: {
  imports = [
    ./anyrun
    ./browsers/brave.nix
    ./browsers/firefox.nix
    ./gtk.nix
    ./media
  ];

  home.packages = with pkgs; [
    # messaging
    tdesktop

    xfce.thunar
    xfce.thunar-archive-plugin
    ps_mem

    vesktop
    discordo

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

    gnome.file-roller

    inputs.matugen.packages.${pkgs.system}.default
  ];
}
