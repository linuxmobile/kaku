{
  imports = [
    # editors
    ../../editors/helix
    ../../editors/zed

    # software
    ../../software

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/syncthing.nix
  ];
}
