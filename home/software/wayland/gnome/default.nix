{
  pkgs,
  ...
}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
  ];

  home = {
    packages = with pkgs; [
      amberol
      cavalier
      (celluloid.override {youtubeSupport = true;})
      # denaro // isn't working.
      dialect
      easyeffects
      eyedropper
      keypunch
      kooha
      loupe
      newsflash
      packet
      paper-plane
      (papers.override {supportNautilus = true;})
      # planify
      resources

      ghostty
      nwg-look
      inkscape
    ];
  };
}
