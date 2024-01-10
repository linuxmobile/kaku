{pkgs, ...}:
# Wayland config
{
  imports = [
    # ../software/ags
    ./ags
    ./anyrun.nix
    ./hyprland
    # ./hyprpaper.nix
    # ./waybar
    ./swayidle.nix
    ./swaylock.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp

    # utils
    wl-clipboard
    wl-screenrec
    wlogout
    hyprpicker
    wlsunset
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  # fake a tray to let apps start
  # https://github.com/nix-community/home-manager/issues/2064
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = ["graphical-session-pre.target"];
    };
  };
}
