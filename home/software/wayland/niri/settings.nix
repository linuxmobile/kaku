{
  config,
  pkgs,
  ...
}: let
  pointer = config.home.pointerCursor;
in {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = null;
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        WLR_RENDERER = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        GTK_IM_MODULE = "simple";
      };
      spawn-at-startup = [
        {command = ["wl-paste" "--watch" "cliphist" "store"];}
        {command = ["wl-paste" "--type text" "--watch" "cliphist" "store"];}
        {command = ["qs" "-c" "noctalia"];}
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
          middle-emulation = true;
          accel-profile = "adaptive";
        };
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "90%";
        };
        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;
      };
      screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
      outputs = {
        "eDP-1" = {
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = null;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = -1080;
          };
        };
      };

      overview = {
        workspace-shadow.enable = false;
        backdrop-color = "transparent";
      };
      gestures = {hot-corners.enable = true;};
      cursor = {
        size = 20;
        theme = "${pointer.name}";
      };
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
          active.color = "#0d5ba5";
          inactive.color = "#204c78";
        };
        shadow = {
          enable = false;
        };
        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
          {proportion = 1.0;}
        ];
        default-column-width = {proportion = 0.5;};
        always-center-single-column = true;

        gaps = 6;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };

        tab-indicator = {
          hide-when-single-tab = true;
          place-within-column = true;
          position = "left";
          corner-radius = 20.0;
          gap = -12.0;
          gaps-between-tabs = 10.0;
          width = 4.0;
          length.total-proportion = 0.1;
        };
      };
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
    };
  };
}
