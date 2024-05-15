{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
  ];

  home = {
    packages = with pkgs; [
      amberol
      blanket
      celluloid
      contrast
      eyedropper
      gnome-solanum
      halftone
      loupe
      newsflash
      overskride
      paleta
      paper-plane
      resources

      # Terminal
      (blackbox-terminal.override {sixelSupport = true;})
      lsix
    ];
  };
}
