{
  description = "LinuDev Configuration NixOs.";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [./home/profiles ./hosts ./lib ./modules ./pkgs];

      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        devShells = {
          default = pkgs.mkShell {
            packages = [pkgs.alejandra pkgs.git config.packages.repl];
            name = "nixland";
            DIRENV_LOG_FORMAT = "";
          };
          tauri = import ./shell/tauri.nix {inherit inputs system;};
          rust = import ./shell/rust.nix {inherit inputs system;};
          leptos = import ./shell/leptos.nix {inherit inputs system;};
        };
        # Nix Formatter
        formatter = pkgs.alejandra;
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    aesthetic-iosevka.url = "github:alphatechnolog/aesthetic-iosevka";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "hm";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix.url = "github:nix-community/fenix/monthly";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fu.url = "github:numtide/flake-utils";

    helix = {
      url = "github:helix-editor/helix";
      inputs.flake-utils.follows = "fu";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypridle.url = "github:hyprwm/hypridle";

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlock.url = "github:hyprwm/hyprlock";

    hyprpaper.url = "github:hyprwm/hyprpaper";

    matugen = {
      url = "github:InioX/matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:MichaelPachec0/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sss = {
      url = "github:SergioRibera/sss/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    twitch-hls-client.url = "github:2bc4/twitch-hls-client/";

    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
  };
}
