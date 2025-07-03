{
  config,
  lib,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "Adwaita Sans";
      package = pkgs.adwaita-fonts;
      size = 10;
    };

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme.override {
        boldPanelIcons = true;
        alternativeIcons = true;
      };
    };

    gtk3 = {
      bookmarks = [
        "file://${config.home.homeDirectory}/Documents"
        "file://${config.home.homeDirectory}/Downloads"
        "file://${config.home.homeDirectory}/Music"
        "file://${config.home.homeDirectory}/Pictures"
        "file://${config.home.homeDirectory}/Videos"
      ];
    };
  };
  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
}
