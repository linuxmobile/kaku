_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    kwin = {
      virtualDesktops = {
        rows = 1;
        number = 5;
        names = [
          "Desktop 1"
          "Desktop 2"
          "Desktop 3"
          "Desktop 4"
          "Desktop 5"
        ];
      };

      # effects = {
      #   desktopSwitching.animation = "off";
      #   shakeCursor.enable = false;
      # };
    };
  };
}
