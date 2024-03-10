{
  inputs,
  system,
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  fenix = inputs.fenix;
  toolchain = fenix.packages.${system}.minimal.toolchain;
in
  pkgs.mkShell {
    buildInputs = with pkgs;
      [
        openssl
        pkg-config
        cacert
        cargo-make
        trunk
        toolchain
      ]
      ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
        darwin.apple_sdk.frameworks.SystemConfiguration
      ];

    shellHook = ''
      echo "Bienvenido a tu entorno de desarrollo Leptos."
    '';
  }
