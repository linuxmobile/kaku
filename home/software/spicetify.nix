{ inputs
, pkgs
, ...
}: {
  # themable spotify
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
    in
    {
      enable = true;
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      sidebarConfig = true;
      enabledCustomApps = with spicePkgs.apps; [ lyrics-plus new-releases ];
      theme = spicePkgs.themes.Dribbblish;
      colorScheme = "catpuccin-mocha";
      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        shuffle
        adblock
        playlistIcons
        lastfm
        genre
        historyShortcut
        bookmark
        fullAlbumDate
        groupSession
        popupLyrics
      ];
    };
}
