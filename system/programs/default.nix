{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./nix-ld.nix
  ];

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
    xfconf.enable = true;
  };
}
