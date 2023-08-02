{ default, ... }: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "${default.terminal.font}";
        # dpi-aware = "auto";
        pad = "4x4 center";
      };
      cursor = {
        color = "1a1026 d9e0ee";
        blink = false;
        style = "block";
        beam-thickness = "2";
        underline-thickness = "2";
      };
      colors = {
        # Catppuccin Espresso
        alpha = "0.8";
        foreground = "CDD6F4"; # Text
        background = "11111B"; # Base
        regular0 = "45475A"; # Surface 1
        regular1 = "F38BA8"; # red
        regular2 = "A6E3A1"; # green
        regular3 = "F9E2AF"; # yellow
        regular4 = "89B4FA"; # blue
        regular5 = "F5C2E7"; # pink
        regular6 = "94E2D5"; # teal
        regular7 = "BAC2DE"; # Subtext 1
        bright0 = "585B70"; # Surface 2
        bright1 = "F38BA8"; # red
        bright2 = "A6E3A1"; # green
        bright3 = "F9E2AF"; # yellow
        bright4 = "89B4FA"; # blue
        bright5 = "F5C2E7"; # pink
        bright6 = "94E2D5"; # teal
        bright7 = "A6ADC8"; # Subtext 0
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
