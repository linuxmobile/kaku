{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.twitch-hls-client.homeManagerModules.default
  ];
  programs.twitch-hls-client = {
    enable = true;
  };
  systemd.user.services.twitch-hls-client = {
    Unit = {
      Description = "Twitch HLS Client Service";
    };

    Service = {
      Type = "simple";
      ExecStart = "twitch-hls-client -c ${config.xdg.configHome}/twitch-hls-client/config";
      Restart = "always";
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
