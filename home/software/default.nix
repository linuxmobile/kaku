{
  pkgs,
  inputs,
  ...
}: {
  imports = [
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
    rizin
    xcolor
    nodejs
    nodePackages.pnpm
    jq
    socat
    catimg
    bun

    scrcpy
  ];
}
