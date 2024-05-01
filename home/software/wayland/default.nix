{pkgs, ...}:
# Wayland config
{
  home.packages = with pkgs; [
    # screenshot
    grim
    slurp

    # utils
    wl-clipboard
    wl-screenrec
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
