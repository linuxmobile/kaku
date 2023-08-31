{pkgs, ...}:
# Wayland config
{
  imports = [
    ./anyrun.nix
    ./hyprland
    ./waybar
    ./swaybg.nix
    ./swayidle.nix
    ./swaylock.nix
    ./swww.nix
    ./eww.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp

    # idle/lock
    swaybg
    swaylock-effects
    # swww

    # utils
    wf-recorder
    wl-clipboard
    wlogout
    hyprpicker
    wlsunset
    eww-wayland
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
