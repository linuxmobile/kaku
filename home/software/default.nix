{
  config,
  ...
}: {
  imports = [
    ../shell/nix.nix
    ../terminals/wezterm.nix
    ../terminals/cava.nix
    ../terminals/neofetch.nix
    ./bottom.nix
    ./files
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./media.nix
    ./qt.nix
    ./packages.nix
    ./spicetify.nix
    ./xdg.nix
    ./yazi

    # Apps
    ./obs.nix
    ./vscode.nix
  ];

  programs = {
    brave = {
      enable = true;
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryFlavor = "gnome3";
    };
    syncthing.enable = true;
  };
}
