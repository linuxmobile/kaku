{pkgs, ...}: {
  home.packages = with pkgs; [
    (caido.override {appVariants = ["desktop"];})
  ];

  xdg.desktopEntries.caido = {
    name = "Caido";
    exec = "caido --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
    terminal = false;
    type = "Application";
    icon = "caido";
    comment = "Official desktop application for Caido";
    categories = ["Network"];
    settings = {
      "StartupWMClass" = "Caido";
    };
  };
}
