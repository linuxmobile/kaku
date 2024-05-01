{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    # ./qt.nix
  ];

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
    seahorse.enable = true;
    xfconf.enable = true;
  };
}
