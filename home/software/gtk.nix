{
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
    gtk2.enable = false;

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme.override {
        boldPanelIcons = true;
        alternativeIcons = true;
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/gtk.css".enable = lib.mkForce false;
    "gtk-3.0/gtk.css".enable = lib.mkForce false;
    "gtk-4.0/settings.ini".enable = lib.mkForce false;
    "gtk-3.0/settings.ini".enable = lib.mkForce false;
  };

  home.sessionVariables = {
    XDG_ICON_DIR = "${pkgs.whitesur-icon-theme}/share/icons/WhiteSur";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
  };
}
