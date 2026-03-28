_: {
  programs.niri.enable = true;

  services = {
    displayManager.autoLogin.enable = false;

    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/banmath";
      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };

    greetd.settings = {
      initial_session = {
        user = "banmath";
        command = "niri-session";
      };
    };
  };
}
