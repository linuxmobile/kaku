{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./terminal
    inputs.nix-index-db.homeModules.nix-index
    inputs.stylix.homeModules.stylix
  ];
  home = {
    username = "linuxmobile";
    homeDirectory = "/home/linuxmobile";
    stateVersion = "24.05";
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;

  programs.nix-index = {
    enable = true;
  };

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    opacity = {
      popups = 1.0;
      terminal = 1.0;
    };

    fonts = {
      serif = config.stylix.fonts.sansSerif;
      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.zed-mono;
        name = "ZedMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    base16Scheme = "${inputs.self}/home/shared/colors/charm.yaml";

    targets = {
      bat.enable = true;
      helix.enable = true;
      nixos-icons.enable = true;
      nushell.enable = true;
      qt.enable = true;
      starship.enable = true;
      yazi.enable = true;
    };
  };
}
