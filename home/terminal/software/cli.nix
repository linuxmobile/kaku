{pkgs, ...}: {
  home.packages = with pkgs; [
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

    tuicam
    fum
    meteor-git
  ];

  programs = {
    eza.enable = true;
    ssh.enable = true;
    dircolors = {
      enable = true;
      enableFishIntegration = true;
    };
    autojump = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
