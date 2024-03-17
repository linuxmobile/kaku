{
  imports = [
    # editors
    ../../editors/helix
    ../../editors/vscode

    # services
    ../../services/ags

    # media services
    ../../services/media/playerctl.nix

    # software
    ../../software
    ../../software/wayland

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/screensht.nix
    ../../services/system/syncthing.nix

    # wayland specific
    ../../services/wayland/hyprpaper.nix
    ../../services/wayland/hypridle.nix

    # terminal emulators
    ../../terminal/emulators/foot.nix
    ../../terminal/emulators/wezterm.nix
  ];
}
