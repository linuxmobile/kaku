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
      du-dust
      duf
      fd
      file
      jaq
      ripgrep
      killall
      jq

      discordo
      fum
      glow
      gtt
      meteor-git
      reddit-tui
      scope-tui
      tuicam
      wiremix
      zfxtop
      nix-search-tv
      television
    ]
    ++ (with inputs.mynixpkgs.packages.${pkgs.system}; [
      opencode
      toney
      bmm
      omm
      prs
      dfft
      crush
    ]);

  programs = {
    eza.enable = true;
    ssh.enable = true;
    dircolors = {
      enable = true;
      # enableNushellIntegration = true;
    };
    autojump = {
      enable = true;
      # enableNushellIntegration = true;
    };
  };
}
