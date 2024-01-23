let desktop = [
  ./core/boot.nix
  ./core/default.nix

  ./hardware/opengl.nix

  ./network/default.nix

  ./programs

  ./services
  ./services/pipewire.nix
];
in {
  inherit desktop;
}
