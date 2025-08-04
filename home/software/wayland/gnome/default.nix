{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
  ];

  home = {
    packages = with pkgs; [
      amberol
      cavalier
      (celluloid.override {youtubeSupport = true;})
      dialect
      easyeffects
      eyedropper
      keypunch
      kooha
      loupe
      newsflash
      (papers.override {supportNautilus = true;})
      # planify
      resources

      ghostty
      nwg-look
      inkscape
    ];
  };
}
