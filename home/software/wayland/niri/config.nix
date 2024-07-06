{
  config,
  lib,
  ...
}: let
  pointer = config.home.pointerCursor;
  makeCommand = command: {
    command = [command];
  };
in {
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      environment = {
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      };
      spawn-at-startup = [
        (makeCommand "/usr/libexec/polkit-gnome-authentication-agent-1")
        (makeCommand "hyprlock")
        (makeCommand "systemctl --user start clight")
        (makeCommand "wl-paste --type image --watch cliphist store")
        (makeCommand "wl-paste --type text --watch cliphist store")
      ];
      input = {
        keyboard.xkb.layout = "latam";
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
        };
        focus-follows-mouse = true;
        warp-mouse-to-focus = true;
        workspace-auto-back-and-forth = true;
      };
      outputs = {
        "eDP-1" = {
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          scale = 1.0;
          position = {
            x = 0;
            y = -1080;
          };
        };
      };
      cursor = {
        size = ${pointer.size};
        theme = "${pointer.name}";
      };
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 1;
          active.color = "#ffffff";
          inactive.color = "#000000";
        };

        preset-column-widths = [
          {proportion = 1.0 / 3.0;}
          {proportion = 1.0 / 2.0;}
          {proportion = 2.0 / 3.0;}
        ];
        default-column-width = {proportion = 1.0 / 2.0;};

        gaps = 8;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };
      binds = with config.lib.niri.actions; let
        set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
        brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
        playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
        ags = spawn "${pkgs.ags}/bin/ags" "-r";

        dynamicBinds = lib.attrsets.mergeAttrsList (map (x: let
          xStr = builtins.toString x;
        in {
          "${"Mod+" + xStr}".action = focus-workspace x;
          "${"Mod+Shift+" + xStr}".action = move-column-to-workspace x;
        }) [1 2 3 4 5 6 7 8 9]);
      in
        dynamicBinds
        // {
          "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
          "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

          "XF86AudioPlay".action = playerctl "play-pause";
          "XF86AudioStop".action = playerctl "pause";
          "XF86AudioPrev".action = playerctl "previous";
          "XF86AudioNext".action = playerctl "next";

          "XF86AudioRaiseVolume".action = set-volume "5%+";
          "XF86AudioLowerVolume".action = set-volume "5%-";

          "XF86MonBrightnessUp".action = brillo "-A" "5";
          "XF86MonBrightnessDown".action = brillo "-U" "5";

          "XF86Calculator".action = ags "recorder.start()";
          "Print".action = ags "recorder.screenshot(true)";
          "Mod+Shift+S".action = ags "'recorder.screenshot()'";
          "Mod+D".action = spawn "${pkgs.anyrun}/bin/anyrun}";
          "Mod+Return".action = spawn "${pkgs.foot}/bin/foot";
          # "Ctrl+Alt+L".action = spawn "pgrep hyprlock || hyprlock";

          "Mod+Q".action = close-window;
          "Mod+S".action = switch-preset-column-width;
          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;

          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+H".action = focus-column-left;
          "Mod+L".action = focus-column-right;
          "Mod+J".action = focus-window-or-monitor-down;
          "Mod+K".action = focus-window-or-monitor-up;

          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+L".action = move-column-right;
          "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
          "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
        };
      window-rules = {};
    };
  };
}
