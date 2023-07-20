{
  imports = [
    # ../../editors/neovim
    ../../software
    ../../software/dunst.nix
    ../../wayland
    ../../terminals/wezterm.nix
    # ../../terminals/cava.nix
    # ../../terminals/neofetch.nix
  ];

  home.sessionVariables = {
    GDK_SCALE = "1";
  };
}
