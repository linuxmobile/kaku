{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.libsixel];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce (
          "Cozette:size=10"
          + ":fontfeatures=calt"
          + ":fontfeatures=dlig"
          + ":fontfeatures=fbarc"
          + ":fontfeatures=liga,PragmataProMonoLiga Nerd Font:size=8"
        );

        horizontal-letter-offset = 0;
        vertical-letter-offset = 0;
        pad = "15x6center";
        term = "xterm-256color";
        selection-target = "both";
        include = "${config.xdg.configHome}/foot/themes/noctalia";
      };
      bell = {
        command = "notify-send bell";
        command-focused = "no";
        notify = "yes";
        urgent = "yes";
      };
      desktop-notifications.command = "${lib.getExe pkgs.libnotify} -a \${app-id} -i \${app-id} \${title} \${body}";
      scrollback = {
        lines = 1000;
        multiplier = 3;
        indicator-position = "relative";
        indicator-format = "line";
      };
      url = {
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
      };
      cursor = {
        style = "beam";
        beam-thickness = "2";
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
      colors = {
        alpha = 1.0;
      };
    };
  };
}
