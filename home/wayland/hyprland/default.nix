{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [./config.nix];

  home = {
    packages = with pkgs; [
      seatd
      jaq
      xorg.xprop
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      self.packages.${pkgs.system}.xwaylandvideobridge
    ];
    file = {
      ".config/hypr/scripts/volume" = {
        source = ./scripts/volume;
        executable = true;
      };
      ".config/hypr/scripts/screensht" = {
        source = ./scripts/screensht;
        executable = true;
      };
      ".config/hypr/scripts/colorpicker" = {
        source = ./scripts/colorpicker;
        executable = true;
      };
      ".config/hypr/scripts/blurtoggle" = {
        source = ./scripts/blurtoggle;
        executable = true;
      };
    };
  };

  # start swayidle as part of hyprland, not sway
  systemd.user.services.swayidle.Install.WantedBy =
    lib.mkForce ["hyprland-session.target"];

  # enable hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
