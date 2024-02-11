{
  config,
  lib,
  ...
}: let
  c = config.programs.matugen.theme.colors.colors.${config.theme.name};
  pointer = config.home.pointerCursor;
  homeDir = config.home.homeDirectory;
in {
  wayland.windowManager.hyprland = {
    settings = {
      "$MOD" = "SUPER";
      env = ''
        XDG_SESSION_TYPE,wayland
        XDG_SESSION_DESKTOP,Hyprland

        GDK_BACKEND,wayland
        QT_QPA_PLATFORM,wayland
        QT_QPA_PLATFORMTHEME,qt5ct
        QT_WAYLAND_DISABLE_WINDOWDECORATION,1
        QT_AUTO_SCREEN_SCALE_FACTOR,1
        QT_WAYLAND_DISABLE_WINDOWDECORATION,1

        SDL_VIDEODRIVER,wayland
        _JAVA_AWT_WM_NONREPARENTING,1
        WLR_NO_HARDWARE_CURSORS,1
        WLR_DRM_NO_ATOMIC,1

        MOZ_DISABLE_RDD_SANDBOX,1
        MOZ_ENABLE_WAYLAND,1

        OZONE_PLATFORM,wayland
      '';
      exec-once = [
        "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "echo latam > /tmp/kb_layout"
        "wlsunset -t 5200 -S 9:00 -s 19:30"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1"
        "echo 'Xft.dpi: 130' | xrdb -merge"
        "hyprctl dispatcher focusmonitor 1"
      ];
      xwayland = {force_zero_scaling = true;};
      input = {
        kb_layout = "latam";
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = 1;
        accel_profile = "flat";
      };
      misc = {
        disable_autoreload = true;
        animate_mouse_windowdragging = false;
        vrr = 1;
        no_direct_scanout = false;
        vfr = true;
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };
      general = {
        monitor = [
          "HDMI-A-2,1920x1080@75,1366x0,1"
          "DP-1,1366x768@60,0x0,1"
        ];
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgb(${c.on_primary});";
        "col.inactive_border" = "rgb(${c.inverse_on_surface})";
        "no_border_on_floating" = false;
        layout = "dwindle";
        no_cursor_warps = true;
      };
      decoration = {
        rounding = 3;
        blur = {
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = "0.1";
          contrast = "1.1";
          brightness = "1.2";
          xray = true;
        };
        fullscreen_opacity = 1;
        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "0 8";
        shadow_range = 50;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000055)";
        blurls = ["lockscreen" "waybar" "popups"];
      };
      animation = {
        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];
        animation = [
          "windowsIn, 1, 1.7, easeOutCubic, slide" # window open
          "windowsOut, 1, 1.7, easeOutCubic, slide" # window close
          "windowsMove, 1, 2.5, easeinoutsine, slide" # everything in between, moving, dragging, resizing

          # fading
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 3, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 1, 5, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 5, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 6, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "workspaces, 1, 2, fluent_decel, slide" # styles: slide, slidevert, fade, slidefade, slidefadevert
          "specialWorkspace, 1, 3, fluent_decel, slidevert"
        ];
      };
      dwindle = {
        no_gaps_when_only = false;
        pseudotile = true;
        preserve_split = true;
      };
      master = {new_is_master = true;};

      "$VIDEODIR" = "$HOME/Videos";
      "$NOTIFY" = "notify-send -h string:x-canonical-private-synchronouse:hypr-cfg -u low";
      "$COLORPICKER" = "${homeDir}/.config/hypr/scripts/colorpicker";
      "$BLURTOGGLE" = "${homeDir}/.config/hypr/scripts/blurtoggle";
      "$LAYERS" = "^(eww-.+|bar|system-menu|anyrun|gtk-layer-shell|osd[0-9]|dunst)$";

      bind = [
        "$MOD, Escape, exec, wlogout -p layer-shell"
        "$MOD, V, exec, wf-recorder -f $VIDEODIR/$(date +%Y-%m-%d_%H-%M-%S).mp4"
        "$MOD, V, exec, $NOTIFY 'Recording started'"
        "$MODSHIFT, V, exec, killall -s SIGINT wf-recorder"
        "$MODSHIFT, V, exec, $NOTIFY 'Recording stopped'"

        ", Print, exec, screenshot-full"
        "$MODSHIFT, S, exec, screenshot-area"
        "$MODSHIFT, X, exec, $COLORPICKER"
        "$MOD, B, exec, $BLURTOGGLE"

        "$MOD, D, exec, pkill .anyrun-wrapped || run-as-service anyrun"
        "$MOD, Return, exec, run-as-service wezterm"
        "$MODSHIFT, L, exec, loginctl lock-session"

        "$MOD, Q, killactive"
        "$MODSHIFT, Q, exit"
        "$MOD, F, fullscreen"
        "$MOD, Space, togglefloating"
        "$MOD, P, pseudo"
        "$MOD, S, togglesplit"
        "$MOD, O, toggleopaque"

        "$MODSHIFT, Space, workspaceopt, allfloat"
        "$MODSHIFT, P, workspaceopt, allpseudotile"

        "$MOD, Tab, cyclenext"
        "$MOD, Tab, bringactivetotop"

        "$MOD, A, togglespecialworkspace"
        "$MODSHIFT, A, movetoworkspace, special"
        "$MOD, C, exec, hyprctl dispatch centerwindow"

        "$MOD, K, movefocus, u"
        "$MOD, J, movefocus, d"
        "$MOD, L, movefocus, r"
        "$MOD, H, movefocus, l"

        "${builtins.concatStringsSep "\n" (builtins.genList (x: let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $MOD, ${ws}, workspace, ${toString (x + 1)}
            bind = $MODSHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
            bind = $MOD+CTRL, ${ws}, focusworkspaceoncurrentmonitor, ${toString (x + 1)}
          '')
          10)}"
        "$MOD, mouse_down, workspace, e-1"
        "$MOD, mouse_up, workspace, e+1"
      ];

      bindle = let
        e = "exec, ags";
      in [
        "$MOD, Tab, ${e} -t overview"
      ];

      bindl = let
        e = "exec, ags -r";
      in [
        "$MOD, F3, ${e} 'audio.speaker.isMuted = !audio.speaker.isMuted'"
        "$MOD, F4, ${e} 'audio.speaker.volume += 0.02; indicator.speaker()'"
        "$MOD, F5, ${e} 'audio.speaker.volume -= 0.02; indicator.speaker()'"
      ];

      bindm = ["$MOD, mouse:272, movewindow" "$MOD, mouse:273, resizewindow"];
      windowrulev2 = [
        "opacity 0.90 0.90,class:^(org.wezfurlong.wezterm)$"
        "opacity 0.90 0.90,class:^(foot)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.90 0.90,class:^(brave-browser)$"
        "opacity 0.90 0.90,class:^(firefox)$"
        "opacity 0.80 0.80,class:^(Steam)$"
        "opacity 0.80 0.80,class:^(steam)$"
        "opacity 0.80 0.80,class:^(steamwebhelper)$"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,class:^(Code)$"
        "opacity 0.80 0.80,class:^(thunar)$"
        "opacity 0.80 0.80,class:^(file-roller)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(VencordDesktop|Webcord|discord|Discord)"
        "opacity 0.80 0.70,class:^(pavucontrol)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 0.80 0.80,class:^(org.telegram.desktop)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "opacity 0.80 0.80,title:^(Spotify( Premium)?)$"
        "opacity 0.80 0.80,title:^(Spotify( Free)?)$"
        "opacity 0.90 0.90, class:^(inlyne)$"

        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(pavucontrol)$"
        "float,title:^(Media viewer)$"
        "float,title:^(Volume Control)$"
        "float,class:^(Viewnior)$"
        "float,title:^(DevTools)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        "float,class:^(com.github.Aylur.ags)$"

        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "idleinhibit fullscreen, class:^(Brave-browser)$"

        "dimaround, class:^(xdg-desktop-portal-gtk)$"
        "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

        "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"
        "workspace special silent, title:^(Firefox — Sharing Indicator)$"

        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
        "noshadow,class:^(xwaylandvideobridge)$"
      ];
      layerrule = let
        toRegex = list: let
          elements = lib.concatStringsSep "|" list;
        in "^(${elements})$";

        ignorealpha = [
          "calendar"
          "notifications"
          "osd"
          "system-menu"

          "anyrun"
          "popups"
        ];
        layers = ignorealpha ++ ["bar" "gtk-layer-shell"];
      in [
        "blur, ${toRegex layers}"
        "xray 1, ${toRegex ["bar" "gtk-layer-shell"]}"
        "ignorealpha 0.2, ${toRegex ["bar" "gtk-layer-shell"]}"
        "ignorealpha 0.5, ${toRegex (ignorealpha ++ ["music"])}"
      ];
    };
  };
}
