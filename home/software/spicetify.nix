{inputs', ...}: {
  # themable spotify
  programs.spicetify = let
    spicePkgs = inputs'.spicetify-nix.packages.default;
  in {
    enable = true;

    theme = spicePkgs.themes.catppuccin-mocha;

    colorScheme = "mauve";

    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
      adblock
    ];
  };
}
