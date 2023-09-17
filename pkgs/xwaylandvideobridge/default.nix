{
  stdenv,
  fetchFromGitLab,
  fetchpatch,
  cmake,
  pkg-config,
  extra-cmake-modules,
  qt5,
  libsForQt5,
  wrapQtAppsHook,
}:
stdenv.mkDerivation {
  pname = "xwaylandvideobridge";
  version = "unstable-2023-05-28";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "b9e0c53570f55f4e8289f72ba78f3945e27e1a1a";
    hash = "sha256-tnWfpx/6aABe0VdIjOtx3oDL8C4uQo0yTd6VbAQT7/o=";
  };

  nativeBuildInputs = [cmake extra-cmake-modules pkg-config wrapQtAppsHook];

  patches = [
    (fetchpatch {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
      hash = "sha256-ynxv914irLRAfjo0mjrXkcr++Sdxzvd9b2RvvA0HBGo=";
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
