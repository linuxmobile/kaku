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
    koji
    jq

    tuicam
    fum
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
