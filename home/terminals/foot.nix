{ default, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font =
          "${default.terminal.font}:size=${toString default.terminal.size}";
        box-drawings-uses-font-glyphs = "yes";
        dpi-aware = "yes";
        pad = "4x4center";
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
        foreground = "DED7D0"; # Text
        background = "1E1D23"; # Base
        regular0 = "2E2930"; # Surface 1
        regular1 = "D95555"; # red
        regular2 = "7EC49D"; # green
        regular3 = "EFD472"; # yellow
        regular4 = "8BB8D0"; # blue
        regular5 = "BDA9D4"; # pink
        regular6 = "B898DD"; # teal
        regular7 = "cccccc"; # Subtext 1
        bright0 = "29292E"; # Surface 2
        bright1 = "D95555"; # red
        bright2 = "7EC49D"; # green
        bright3 = "EFD472"; # yellow
        bright4 = "8BB8D0"; # blue
        bright5 = "BDA9D4"; # pink
        bright6 = "B898DD"; # teal
        bright7 = "1A191E"; # Subtext 0
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
