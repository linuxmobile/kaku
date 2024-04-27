{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
  ];

  home = {
    packages = lib.attrValues {
      # Utilities
      inherit
        (pkgs)
        amberol
        celluloid
        loupe
        blackbox-terminal
        lsix
        ;
    };
  };
}
