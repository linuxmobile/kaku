{
  description = "linuxmobile Config. Take Care about it";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./home/profiles
        ./hosts
        ./lib
        ./modules
        # ./pkgs
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.alejandra
            pkgs.git
            config.packages.repl
          ];
          name = "nixland";
          DIRENV_LOG_FORMAT = "";
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

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "hm";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fu.url = "github:numtide/flake-utils";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs = {
        flake-parts.follows = "flake-parts";
        flake-utils.follows = "fu";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-gaming = {
    #   url = "github:fufexan/nix-gaming";
    #   inputs.flake-parts.follows = "flake-parts";
    # };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "fu";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://helix.cachix.org"
      "https://fufexan.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://hyprland.cachix.org"
      "https://cache.privatevoid.net"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fufexan.cachix.org-1:LwCDjCJNJQf5XD2BV+yamQIMZfcKWR9ISIFy5curUsY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
      #"nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      #"helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };
}

#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#     utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
#     hyprland.url = "github:hyprwm/Hyprland/";
#     hyprland-contrib.url = "github:hyprwm/contrib";
#     nur.url = "github:nix-community/NUR";
#     nix-colors.url = "github:misterio77/nix-colors";
#
#     # Spicetify
#     spicetify-nix = {
#       url = "github:the-argus/spicetify-nix";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#
#     # SFMono w/ patches
#     sf-mono-liga-src = {
#       url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
#       flake = false;
#     };
#
#     home-manager = {
#       url = "github:nix-community/home-manager";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#   };
#
#   outputs = {
#     self,
#     nixpkgs,
#     hyprland,
#     home-manager,
#     utils,
#     ...
#   } @ inputs: {
#     nixosConfigurations = {
#       linudev =
#         nixpkgs.lib.nixosSystem
#         {
#           system = "x86_64-linux";
#           specialArgs = {
#             inherit
#               inputs
#               hyprland
#               ;
#           };
#           modules = [
#             ./hosts/linudev/configuration.nix
#             home-manager.nixosModules.home-manager
#             {
#               home-manager = {
#                 useUserPackages = true;
#                 useGlobalPkgs = false;
#                 extraSpecialArgs = {inherit inputs;};
#                 users.linuxmobile = ./home/linuxmobile/home.nix;
#               };
#             }
#             hyprland.nixosModules.default
#             {programs.hyprland.enable = true;}
#           ];
#         };
#     };
#   };
# }
