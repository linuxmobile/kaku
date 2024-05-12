{
  pkgs,
  config,
  ...
}: let
  colors = {
    dark = {
      foreground = "ebdbb2";
      background = "131313";
      regular0 = "3C3836"; # black
      regular1 = "EA6962"; # red
      regular2 = "A9B665"; # green
      regular3 = "D8A657"; # yellow
      regular4 = "7DAEA3"; # blue
      regular5 = "D3869B"; # magenta
      regular6 = "89B482"; # cyan
      regular7 = "D4BE98"; # white
      bright0 = "3C3836"; # bright black
      bright1 = "EA6962"; # bright red
      bright2 = "A9B665"; # bright green
      bright3 = "D8A657"; # bright yellow
      bright4 = "7DAEA3"; # bright blue
      bright5 = "D3869B"; # bright magenta
      bright6 = "89B482"; # bright cyan
      bright7 = "D4BE98"; # bright white
    };
    light = {
      foreground = "3c3836";
      background = "fbf1c7";
      regular0 = "fbf1c7"; # black
      regular1 = "cc241d"; # red
      regular2 = "98971a"; # green
      regular3 = "d79921"; # yellow
      regular4 = "458588"; # blue
      regular5 = "b16286"; # magenta
      regular6 = "689d6a"; # cyan
      regular7 = "7c6f64"; # white
      bright0 = "fbf1c7"; # bright black
      bright1 = "9d0006"; # bright red
      bright2 = "79740e"; # bright green
      bright3 = "b57614"; # bright yellow
      bright4 = "076678"; # bright blue
      bright5 = "8f3f71"; # bright magenta
      bright6 = "427b58"; # bright cyan
      bright7 = "3c3836"; # bright white
    };
  };
in {
  home.packages = [pkgs.libsixel];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "GeistMono Nerd Font:size=7.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga";
        box-drawings-uses-font-glyphs = "yes";
        dpi-aware = "yes";
        pad = "25x25center";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
        include = "${config.xdg.configHome}/foot/theme.ini";
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
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
      colors = {
        alpha = 0.9;
      };
      # // colors.${config.theme.name};
    };
  };
}
