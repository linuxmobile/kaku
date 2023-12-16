{default, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "${default.terminal.font}:size=${toString default.terminal.size}";
        box-drawings-uses-font-glyphs = "yes";
        dpi-aware = "yes";
        pad = "25x25center";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
      };
      scrollback = {
        lines = 10000;
        multiplier = 3;
      };
      url = {
        launch = "xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file";
        uri-characters = ''
          abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]'';
      };
      cursor = {
        style = "beam";
        beam-thickness = "2";
      };
      colors = {
        alpha = default.terminal.opacity;
        foreground = "dfdddd"; # Text
        background = "0d0d0d"; # Base
        regular0 = "1b1b1b"; # Surface 1
        regular1 = "c14d53"; # red
        regular2 = "56966e"; # green
        regular3 = "dc8c61"; # yellow
        regular4 = "6e95bd"; # blue
        regular5 = "a56db1"; # pink
        regular6 = "6a9f98"; # teal
        regular7 = "b7b7b7"; # Subtext 1
        bright0 = "272727"; # Surface 2
        bright1 = "da4b52"; # red
        bright2 = "57a274"; # green
        bright3 = "e1956c"; # yellow
        bright4 = "6fadea"; # blue
        bright5 = "d466e9"; # pink
        bright6 = "63b4b5"; # teal
        bright7 = "a4b5b5"; # Subtext 0
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
