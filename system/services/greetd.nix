{
  lib,
  pkgs,
  ...
}: {
  # greetd display manager
  services.greetd = let
    session = {
      command = "${lib.getExe pkgs.niri}";
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

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
