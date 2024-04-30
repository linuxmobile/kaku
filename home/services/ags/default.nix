{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  requiredDeps = with pkgs; [
    bash
    brightnessctl
    bun
    config.wayland.windowManager.hyprland.package
    coreutils
    dart-sass
    fd
    fzf
    gawk
    gtk3
    hyprpicker
    imagemagick
    inputs.matugen.packages.${pkgs.system}.default
    networkmanager
    pavucontrol
    ripgrep
    slurp
    swappy
    swww
    util-linux
    wayshot
    which
    wl-clipboard
    wl-screenrec
    gtk3
  ];

  guiDeps = with pkgs; [
    gnome.gnome-control-center
  ];

  dependencies = requiredDeps ++ guiDeps;

  cfg = config.programs.ags;
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags.enable = true;

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = [
        "tray.target"
        "graphical-session.target"
      ];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${cfg.package}/bin/ags -c ${config.xdg.configHome}/ags/config.js";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
