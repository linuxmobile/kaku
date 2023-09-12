{
  pkgs,
  lib,
  inputs,
  ...
}:
# Wayland config
{
  imports = [
    ./anyrun.nix
    ./hyprland
    # ./waybar
    ./swaybg.nix
    ./swayidle.nix
    ./swaylock.nix
    # ./swww.nix
    ./eww
  ];

  programs.eww-hyprland = {
    enable = true;
    # temp fix until https://github.com/NixOS/nixpkgs/pull/249515 lands. after that,
    # eww's nixpkgs has to be updated
    package = inputs.eww.packages.${pkgs.system}.eww-wayland.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [pkgs.wrapGAppsHook];
      buildInputs = lib.lists.remove pkgs.gdk-pixbuf (old.buildInputs ++ [pkgs.librsvg]);
    });
  };

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
    # eww-wayland
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
