{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./browsers/brave.nix
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
    rizin
    xcolor
    nodejs
    nodePackages.pnpm
    jq
    socat
    catimg
    bun

    scrcpy

    # inputs.matugen.packages.${pkgs.system}.default
  ];
}
