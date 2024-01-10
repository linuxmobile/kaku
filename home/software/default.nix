{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../shell/nix.nix
    ../terminals/wezterm.nix
    ../terminals/foot.nix
    ../terminals/cava.nix
    ../terminals/neofetch.nix
    ./files
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./media.nix
    ./qt.nix
    ./spicetify.nix
    ./packages.nix
    ./xdg.nix
    ./yazi

    # Apps
    ./discord.nix
    ./webcord/default.nix
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
