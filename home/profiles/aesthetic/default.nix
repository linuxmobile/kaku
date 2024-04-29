{
  imports = [
    # editors
    ../../editors/helix
    ../../editors/vscode
    ../../editors/zed

    # software
    ../../software
    ../../software/wayland

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/power-monitor.nix
    ../../services/system/syncthing.nix

    # terminal emulators
    ../../terminal/emulators/foot.nix
  ];
}
