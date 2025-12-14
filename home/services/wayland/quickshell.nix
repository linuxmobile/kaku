{
  pkgs,
  lib,
  ...
}: let
  qmlCandidates =
    [pkgs.quickshell]
    ++ (with pkgs.kdePackages; [
      qtbase
      qtdeclarative
      qt6ct
      qtmultimedia
      qtwayland
      kirigami
    ]);
in {
  home.packages = with pkgs;
    [
      quickshell
      accountsservice
      gsettings-desktop-schemas
      brightnessctl
      cava
      cliphist
      ddcutil
      elogind
      glib
      gpu-screen-recorder
      material-symbols
      matugen
      swww
      wl-clipboard
    ]
    ++ qmlCandidates;

  systemd.user.sessionVariables.QML2_IMPORT_PATH =
    lib.makeSearchPath "lib/qt-6/qml" qmlCandidates
    + ":"
    + lib.makeSearchPath "lib/qt-5/qml" qmlCandidates;
}
