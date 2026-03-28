{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      # archives
      zip
      unzip
      unrar

      # misc
      libnotify
      fontconfig

      # utils
      dust
      duf
      fd
      file
      jaq
      killall
      jq
      ps_mem
      inshellisense

      discordo
      fum
      glow
      gtt
      meteor-git
      nix-search-tv
      reddit-tui
      scope-tui
      tuicam
      wiremix
      zfxtop
    ]
    ++ (with inputs.mynixpkgs.packages.${pkgs.system}; [
      bmm
      dawn
      dfft
      lightview
      nekot
      omm
      orchat
      prs
    ]);

  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
      colors = "auto";
      git = true;
      icons = "auto";
    };
    dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
    autojump = {
      enable = true;
      enableFishIntegration = true;
    };
    television = {
      enableFishIntegration = true;
      enable = true;
    };
    mods = {
      enable = true;
      enableFishIntegration = true;
    };
    ripgrep = {
      enable = true;
    };
    nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
    };
    pay-respects = {
      enable = true;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
