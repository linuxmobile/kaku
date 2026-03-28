_: {
  programs.niri.enable = true;

  services = {
    displayManager.autoLogin.enable = false;

    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/linuxmobile";
      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };

    greetd.settings = {
      initial_session = {
        user = "linuxmobile";
        command = "niri-session";
      };
    };
  };
}
