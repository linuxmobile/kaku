{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};

      catppuccin-plymouth = pkgs.callPackage ./catppuccin-plymouth {};

      xwaylandvideobridge = pkgs.libsForQt5.callPackage ./xwaylandvideobridge {};

      nvchad = pkgs.callPackage ./nvchad {};

      inkdrop = pkgs.callPackage ./inkdrop {};

    };
  };
}
