{
  inputs,
  pkgs,
  ...
}:
# Wayland config
{
  imports = [
    ./gnome
  ];

  home.packages = with pkgs; [
    # utils
    wl-clipboard
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    # QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
  };
}
