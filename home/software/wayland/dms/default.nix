{pkgs, ...}: {
  home.packages = with pkgs; [
    qt6Packages.qt6ct
    adw-gtk3
    gsettings-desktop-schemas
  ];
  programs.dankMaterialShell = {
    enable = true;
    niri = {
      enableKeybinds = false;
      enableSpawn = true;
    };

    enableSystemMonitoring = true;
    enableClipboard = false;
    enableDynamicTheming = true;
    enableAudioWavelength = false;
    enableCalendarEvents = false;
  };
}
