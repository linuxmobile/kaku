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
    packages = with pkgs; [
      amberol
      celluloid
      loupe
      (blackbox-terminal.override {sixelSupport = true;})
      lsix
    ];
  };
}
