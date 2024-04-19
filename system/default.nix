let
  desktop = [
    ./core/boot.nix
    ./core/default.nix

    ./hardware/opengl.nix
    ./hardware/fwupd.nix

    ./network/default.nix

    ./programs

    ./services
    ./services/pipewire.nix
  ];

  laptop =
    desktop
    ++ [
      ./network/avahi.nix
      ./hardware/bluetooth.nix

      ./services/backlight.nix
      ./services/power.nix
    ];
in {
  inherit desktop laptop;
}
