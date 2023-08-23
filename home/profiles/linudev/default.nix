{
  imports = [
    # ../../editors/nvchad
    ../../editors/kodo
    ../../software
    ../../software/dunst.nix
    ../../wayland
  ];

  home.sessionVariables = { GDK_SCALE = "1"; };
}
