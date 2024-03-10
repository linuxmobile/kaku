{
  inputs,
  system,
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  fenix = inputs.fenix;
  toolchain = fenix.packages.${system}.minimal.toolchain;
  rust =
    (import inputs.rust-overlay {
      inherit (inputs) nixpkgs;
    })
    .rust-bin
    .stable
    .latest
    .default;
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      rust
      cargo
      openssl
      pkg-config
      rustup
      toolchain
    ];

    shellHook = ''
      echo "Bienvenido a tu entorno de desarrollo Rust."
    '';
  }
