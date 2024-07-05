{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.libsixel];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "GeistMono Nerd Font:size=7.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga";
        box-drawings-uses-font-glyphs = "yes";
        dpi-aware = "yes";
        horizontal-letter-offset = 0;
        vertical-letter-offset = 0;
        pad = "25x25center";
        notify = "${pkgs.libnotify}/bin/notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
        include = "${config.xdg.configHome}/foot/theme.ini";
      };
      scrollback = {
        lines = 10000;
        multiplier = 3;
      };
      url = {
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file, mailto, ipfs";
        uri-characters = ''
          abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]'';
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
