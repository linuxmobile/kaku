{
  config,
  pkgs,
  ...
}: let
  script = pkgs.writeShellScript "theme-changer.sh" ''
    HELIX_THEME="${config.xdg.configHome}/helix/current.toml"

    while true; do
      THEME=$(gsettings get org.gnome.desktop.interface color-scheme)
      case "$THEME" in
        "'prefer-dark'")
          sed -i 's/^\s*inherits = .*/inherits = "mocha"/' $HELIX_THEME
          ;;
        "'prefer-light'")
          sed -i 's/^\s*inherits = .*/inherits = "latte"/' $HELIX_THEME
          ;;
      esac

      # wait for the theme to change
      gsettings monitor org.gnome.desktop.interface color-scheme > /dev/null
    done
  '';
in {
  systemd.user.services.theme-changer = {
    Unit = {
      Description = "Change Software Theme based on Gnome Theme";
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${script}";
      Restart = "always";
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
