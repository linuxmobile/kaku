{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      expat
      libGL
      libglvnd
      dbus
      gtk3
      pango
      gdk-pixbuf
      cairo
      atk
    ];
  };
}
