{ stdenv
, fetchFromGitLab
, fetchpatch
, cmake
, pkg-config
, extra-cmake-modules
, qt5
, libsForQt5
, wrapQtAppsHook
,
}:
stdenv.mkDerivation {
  pname = "xwaylandvideobridge";
  version = "master";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "5c0d9fdc11e9a2a01659b692324ab7634637a3d4";
    hash = "sha256-tnWfpx/6aABe0VdIjOtx3oDL8C4uQo0yTd6VbAQT7/o=";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules pkg-config wrapQtAppsHook ];

  patches = [
    (fetchpatch {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
      hash = "sha256-649kCs3Fsz8VCgGpZ952Zgl8txAcTgakLoMusaJQYa4=";
    })
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    libsForQt5.kdelibs4support
    libsForQt5.kwidgetsaddons
    libsForQt5.kpipewire
    libsForQt5.knotifications
  ];
}
