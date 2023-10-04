{
  imports = [
    # ../../editors/nvchad
    ../../editors/kodo
    # ../../editors/helix
    ../../software
    ../../software/dunst.nix
    ../../wayland
  ];

  home.sessionVariables = {GDK_SCALE = "1";};
}
