{pkgs, ...}: {
  # greetd display manager
  services = {
    greetd = let
      session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "linuxmobile";
      };
    in {
      enable = true;
      settings = {
        terminal.vt = 1;
        default_session = session;
        initial_session = session;
      };
    };
    displayManager.autoLogin = {
      user = "linuxmobile";
      enable = true;
    };
  };
}
