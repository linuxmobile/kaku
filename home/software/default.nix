{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../shell/nix.nix
    ../terminals/wezterm.nix
    # ../terminals/foot.nix
    ../terminals/cava.nix
    ../terminals/neofetch.nix
    ./files
    ./media.nix
    ./git.nix
    ./gtk.nix
    ./packages.nix
    ./qt.nix
    ./spicetify.nix
    ./xdg.nix

    # Apps
    ./discord.nix
    ./obs.nix
    ./webcord/default.nix
    # ./vscode.nix
  ];

  programs = {
    brave = {
      enable = true;
      extensions = [
        # Ublock Origin
        # {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
      ];
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [exts.pass-otp]);
      settings.PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
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
