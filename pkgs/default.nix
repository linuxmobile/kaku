{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      biome = pkgs.callPackage ./biome {};

      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};

      # nvchad = pkgs.callPackage ./nvchad {};

      # kodo = pkgs.callPackage ./kodo {};

      wezterm = pkgs.callPackage ./wezterm {};

      xwaylandvideobridge =
        pkgs.libsForQt5.callPackage ./xwaylandvideobridge {};
    };
  };
}
