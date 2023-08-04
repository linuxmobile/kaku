{ pkgs, lib, default, ... }: {
  systemd.user.services.swww = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.swww} init --no-daemon";
      ExecStartPost = "${lib.getExe pkgs.swww} img ${default.wallpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
