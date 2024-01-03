{
  config, lib, pkgs, ...
}: {
  services.greetd = let
  session = {
    command = "Hyprland";
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

  # unlock gpg keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
