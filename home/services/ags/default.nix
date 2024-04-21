{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  requiredDeps = with pkgs; [
    brightnessctl
    config.wayland.windowManager.hyprland.package
    dart-sass
    fd
    fzf
    gtk3
    hyprpicker
    inputs.matugen.packages.${pkgs.system}.default
    networkmanager
    pavucontrol
    # slurp
    # swappy
    swww
    # wayshot
    wf-recorder
    which
    wl-clipboard
  ];

  guiDeps = with pkgs; [
    gnome.gnome-control-center
    overskride
    wlogout
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
      ExecStart = "${cfg.package}/bin/ags";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
