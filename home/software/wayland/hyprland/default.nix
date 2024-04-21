{
  inputs,
  pkgs,
  ...
}: {
  imports = [./config.nix];

  home = {
    packages = with pkgs; [
      seatd
      jaq
      # xorg.xprop
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      # xwaylandvideobridge
    ];
    file = {
      ".config/hypr/scripts/colorpicker" = {
        source = ./scripts/colorpicker;
        executable = true;
      };
    };
  };

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
