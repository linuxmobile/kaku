{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      biome = pkgs.callPackage ./biome {};

      discordo = pkgs.callPackage ./discordo {};

      phocus = pkgs.callPackage ./phocus {};

      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};

      # wezterm = pkgs.callPackage ./wezterm {};
    };
  };
}
