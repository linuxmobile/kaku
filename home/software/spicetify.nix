{ inputs', self', ... }: {
  # themable spotify
  programs.spicetify = let spicePkgs = inputs'.spicetify-nix.packages.default;
  in {
    enable = true;
    injectCss = true;
    replaceColors = true;
    overwriteAssets = true;
    sidebarConfig = true;
    enabledCustomApps = with spicePkgs.apps; [ lyrics-plus new-releases ];
    theme = spicePkgs.themes.catppuccin-mocha;
    colorScheme = "mauve";
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
