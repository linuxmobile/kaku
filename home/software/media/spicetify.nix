{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];
  # themable spotify
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  in {
    enable = true;
    injectCss = true;
    replaceColors = true;
    overwriteAssets = true;
    sidebarConfig = true;
    # enabledCustomApps = with spicePkgs.apps; [ lyrics-plus new-releases ];
    theme = spicePkgs.themes.Ziro;
    colorScheme = "rosepine";
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      adblock
      playlistIcons
      historyShortcut
      fullAlbumDate
    ];
  };
}
