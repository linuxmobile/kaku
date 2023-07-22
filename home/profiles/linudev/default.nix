{
  imports = [
    ../../editors/nvchad
    ../../software
    ../../software/dunst.nix
    ../../wayland
  ];

  home.sessionVariables = {
    GDK_SCALE = "1";
  };
}
