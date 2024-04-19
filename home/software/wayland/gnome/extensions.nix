{pkgs, ...}: let
  defaultExtensions = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    dash-to-dock
    just-perfection
  ];
in {
  home.packages = with pkgs;
    [
      gnome-extension-manager
    ]
    ++ defaultExtensions;

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = builtins.map (extension: extension.extensionUuid) defaultExtensions;

    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.9;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      # intellihide = true;
      autohide = true;
      background-opacity = 0.0;
      click-action = "previews";
      dash-max-icon-size = 40;
      dock-fixed = true;
      dock-position = "BOTTOM";
      hot-keys = false;
      pressure-threshold = 150.0;
      require-pressure-to-show = true;
      scroll-action = "cycle-windows";
      show-favorites = true;
      show-trash = false;
      transparency-mode = "fixed";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      panel-size = 34;
      window-maximized-on-create = true;
    };
  };
}
