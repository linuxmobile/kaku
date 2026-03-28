_: {
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./xdg.nix
  ];

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
    seahorse.enable = true;
    adb.enable = true;
  };
}
