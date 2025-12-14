{
  imports = [
    # editors
    ../../editors/helix
    ../../editors/zed

    # services
    ../../services/wayland/gammastep.nix
    ../../services/wayland/quickshell.nix

    # media services
    ../../services/media/playerctl.nix

    # software
    ../../software
    ../../software/wayland

    # terminal emulator
    ../../terminal/emulators/foot.nix
    ../../terminal/emulators/ghostty.nix

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/cliphist.nix
    ../../services/system/polkit-agent.nix
  ];
}
