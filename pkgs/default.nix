{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      biome = pkgs.callPackage ./biome {};

      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};

      wezterm = pkgs.callPackage ./wezterm {};
    };
  };
}
