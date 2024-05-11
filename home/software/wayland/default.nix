{pkgs, ...}:
# Wayland config
{
  imports = [
    ./hyprland
    ./hyprlock.nix
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp

    # utils
    wl-clipboard
    wl-screenrec
    hyprpicker
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
  };
}
