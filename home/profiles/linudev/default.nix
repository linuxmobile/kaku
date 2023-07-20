{
  imports = [
    # ../../editors/neovim
    ../../software
    ../../software/dunst.nix
    ../../wayland
  ];

  home.sessionVariables = {
    GDK_SCALE = "1";
  };
}
