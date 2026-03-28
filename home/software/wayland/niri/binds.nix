{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "XF86AudioPlay" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "media"
        "playPause"
      ];
    };

    "XF86AudioStop" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "media"
        "stop"
      ];
    };

    "XF86AudioNext" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "media"
        "next"
      ];
    };

    "XF86AudioPrev" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "media"
        "previous"
      ];
    };

    "XF86AudioMute" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "volume"
        "muteOutput"
      ];
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "volume"
        "muteInput"
      ];
    };

    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "volume"
        "increase"
      ];
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "volume"
        "decrease"
      ];
    };

    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "brightness"
        "increase"
      ];
    };

    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action.spawn = [
        "qs"
        "-c"
        "noctalia"
        "ipc"
        "call"
        "brightness"
        "decrease"
      ];
    };

    "Ctrl+Alt+L".action = spawn [
      "qs"
      "-c"
      "noctalia"
      "ipc"
      "call"
      "lockScreen"
      "lock"
    ];

    "Mod+V".action = spawn [
      "qs"
      "-c"
      "noctalia"
      "ipc"
      "call"
      "launcher"
      "clipboard"
    ];

    "Mod+E".action = spawn [
      "qs"
      "-c"
      "noctalia"
      "ipc"
      "call"
      "launcher"
      "emoji"
    ];

    "Mod+U".action = spawn [
      "qs"
      "-c"
      "noctalia"
      "ipc"
      "call"
      "settings"
      "toggle"
    ];

    "Alt+Space".action = spawn [
      "qs"
      "-c"
      "noctalia"
      "ipc"
      "call"
      "launcher"
      "toggle"
    ];

    "Mod+D".action = spawn [
      "qs"
      "-c"
      "noctalia"
      "ipc"
      "call"
      "launcher"
      "toggle"
    ];

    "Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Shift+Alt+S".action.screenshot-window = [];
    "Mod+Shift+S".action.screenshot = {show-pointer = false;};
    "Mod+Return".action = spawn "${pkgs.foot}/bin/foot";

    "Mod+Q".action = close-window;
    "Mod+S".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;

    "Mod+1".action = set-column-width "25%";
    "Mod+2".action = set-column-width "50%";
    "Mod+3".action = set-column-width "75%";
    "Mod+4".action = set-column-width "100%";
    # "Mod+Shift+F".action = fullscreen-window;
    "Mod+Shift+F".action = expand-column-to-available-width;
    "Mod+Space".action = toggle-window-floating;
    "Mod+W".action = toggle-column-tabbed-display;

    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;
    "Mod+C".action = center-visible-columns;
    "Mod+Tab".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Plus".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Plus".action = set-window-height "+10%";

    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+J".action = move-column-to-workspace-down;

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
  };
}
