{ stdenv
, lib
, libxkbcommon
, libdrm
, alsaLib
, atk
, at-spi2-atk
, cairo
, cups
, dbus
, dpkg
, expat
, fontconfig
, freetype
, fetchurl
, gdk-pixbuf
, glib
, gtk2
, gtk3
, libpulseaudio
, makeWrapper
, nspr
, nss
, pango
, udev
, xorg
, libuuid
, at-spi2-core
, libsecret
, coreutils
, mesa
, gnome
}:

let
  version = "5.5.0";

  deps = [
    libxkbcommon
    libuuid
    libdrm
    libsecret
    alsaLib
    atk
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk2
    gtk3
    libpulseaudio
    nspr
    nss
    pango
    stdenv.cc.cc
    udev
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXtst
    xorg.libxkbfile
    xorg.libxshmfence
    mesa
    gnome.gnome-keyring
  ];

in

stdenv.mkDerivation {
  pname = "inkdrop";
  inherit version;

  src = fetchurl {
    url = "https://d3ip0rje8grhnl.cloudfront.net/v${version}/inkdrop_${version}_amd64.deb";
    # hash = "sha256-JI0H25Bu7uk3ASMo65Gv1YxPc9tC+tAb7M7wFPMyvxk=";
    # hash = "sha256:06dz6bri9w6fxhdx1yj2vdrlz36mmy8yna1304vykvkfj3dhg394";
    # hash = "sha256:183rnh965nxn5vzkgn2q087j0lzi6ly1jg5w3q44zgc8jrgzxyc8";
    hash = "sha256:1l8fxx7p2bg7fck2da9cj0g1xx9ql32v5hyqxjkwarv0xz0fv24f";
  };

  dontBuild = true;
  buildInputs = [ dpkg makeWrapper ];

  unpackPhase = ''
    dpkg --fsys-tarfile $src | tar --extract
  '';

  installPhase = ''
    rm -r ./usr/share/lintian
    rm -r ./usr/share/doc

    mkdir -p $out
    cp -r ./usr/share $out
    cp -r ./usr/bin $out
    cp -r ./usr/lib $out

    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
             "$out/lib/inkdrop/inkdrop"

    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
             "$out/lib/inkdrop/resources/app/ipm/bin/node"

    wrapProgram $out/lib/inkdrop/inkdrop \
      --prefix LD_LIBRARY_PATH : "$out/lib/inkdrop" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath deps}"

    wrapProgram $out/lib/inkdrop/resources/app/ipm/bin/ipm \
      --prefix PATH : "${coreutils.out}/bin" \
      --prefix LD_LIBRARY_PATH : "$out/lib/inkdrop" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath deps}"
  '';

  meta = with lib; {
    homepage = "https://www.inkdrop.app/";
    description = "Organizing your Markdown notes made simple";
    license = licenses.unfreeRedistributable;
    platforms = [ "x86_64-linux" ];
    maintainers = [ maintainers.cstrahan ];
  };
}

