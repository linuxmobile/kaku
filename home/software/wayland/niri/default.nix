{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.homeManagerModules.default ./config.nix];

  home = {
    packages = with pkgs; [
      seatd
      jaq
    ];
  };

  # enable hyprland
  wayland.windowManager.niri = {
    enable = true;
    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start niri-session.target"
      ];
    };
  };
}
