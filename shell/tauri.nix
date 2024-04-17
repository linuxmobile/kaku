{
  inputs,
  system,
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  fenix = inputs.fenix;
  toolchain = fenix.packages.${system}.minimal.toolchain;

  libraries = with pkgs; [
    cairo
    dbus
    gdk-pixbuf
    glib
    gtk3
    librsvg
    openssl_3
    webkitgtk
  ];

  packages = with pkgs; [
    cargo
    cargo-make
    curl
    dbus
    glib
    gtk3
    librsvg
    libsoup
    openssl_3
    pkg-config
    toolchain
    webkitgtk
    wget
  ];
in
  pkgs.mkShell {
    buildInputs = packages;

    shellHook = ''
      export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath libraries}:$LD_LIBRARY_PATH
      export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS
    '';
  }
