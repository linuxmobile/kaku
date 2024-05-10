{
  config,
  pkgs,
  ...
}: let
  script = pkgs.writeShellScript "theme-changer.sh" ''
    HELIX_THEME="${config.xdg.configHome}/helix/themes/current.toml"

    if [ ! -f "$HELIX_THEME" ]; then
      echo "El archivo de tema de Helix no existe: $HELIX_THEME"
      exit 1
    fi

    gsettings monitor org.gnome.desktop.interface color-scheme | while read -r line; do
      COLOR_SCHEME=$(echo $line | awk '{print $2}')
      case "$COLOR_SCHEME" in
      "'prefer-dark'")
        sed -i 's/^inherits = .*/inherits = "mocha"/' $HELIX_THEME
        ;;
      "'default'")
        sed -i 's/^inherits = .*/inherits = "latte"/' $HELIX_THEME
        ;;
      esac
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
