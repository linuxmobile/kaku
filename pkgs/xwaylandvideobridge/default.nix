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
    rev = "9853b50f2494f458e8d103aac631c52a5352b4c9";
    hash = "sha256-enGDIPGdEA9DaqIiVUprdnGuuuQ/B2dq8H7nnid61QE=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    wrapQtAppsHook
  ];

  patches = [
    (fetchpatch {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/cursor-mode.patch?h=xwaylandvideobridge-cursor-mode-2-git";
      hash = "sha256-649kCs3Fsz8VCgGpZ952Zgl8txAcTgakLoMusaJQYa4";
    })
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    libsForQt5.kdelibs4support
    (libsForQt5.kpipewire.overrideAttrs (_oldAttrs: {
      version = "unstable-2023-05-28";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "600505677474a513be4ea8cdc8586f666be7626d"; # Plasma/5.27 branch
        hash = "sha256-ME/9xOyRvvPDiYB1SkJLMk4vtarlIgYdlereBrYTcL4=";
      };
    }))
  ];
}
