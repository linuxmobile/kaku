{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.hyprland.homeManagerModules.default ./config.nix];

  home = {
    packages = with pkgs; [
      seatd
      jaq
      # inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
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
