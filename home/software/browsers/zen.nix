{
  inputs,
  pkgs,
  ...
}: let
  zenFixed = inputs.zen-browser.packages."${pkgs.system}".default.overrideAttrs (old: {
    nativeBuildInputs = [
      pkgs.makeWrapper
      pkgs.copyDesktopItems
      pkgs.wrapGAppsHook3
    ];
  });

  zenWithWayland = pkgs.symlinkJoin {
    name = "zen-browser-wayland";
    paths = [zenFixed];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/zen \
        --set MOZ_ENABLE_WAYLAND 1
    '';
  };
in {
  home.packages = [zenWithWayland];
}
