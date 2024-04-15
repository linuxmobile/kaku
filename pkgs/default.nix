{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      biome = pkgs.callPackage ./biome {};
      discordo = pkgs.callPackage ./discordo {};
      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};
      SF-Mono = pkgs.callPackage ./SF-Mono {inherit (pkgs) stdenv;};
      SF-Pro = pkgs.callPackage ./SF-Pro {inherit (pkgs) stdenv;};
    };
  };
}
