{config, ...}: {
  imports = [
    ../shell/nix.nix
    ../terminals/wezterm.nix
    ../terminals/foot.nix
    ../terminals/cava.nix
    ../terminals/neofetch.nix
    ./files
    ./media.nix
    ./git.nix
    ./gtk.nix
    ./qt.nix
    ./packages.nix
    ./spicetify.nix
    ./xdg.nix

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
