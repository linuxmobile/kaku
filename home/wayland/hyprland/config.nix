{
  config,
  default,
  ...
}: let
  inherit (default) colors;

  pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland.extraConfig = ''
    $mod = SUPER

    monitor = ,preferred,auto,auto

    env = _JAVA_AWT_WM_NONREPARENTING,1
    env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1

    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP # for XDPH
    exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once = echo latam > /tmp/kb_layout
    exec-once = wlsunset -t 5200 -S 9:00 -s 19:30
    exec-once = swaybg -m fill -i ~/.wallpapers/gwen.png
    exec-once = waybar
    exec-once = dunst
    exec-once = xwaylandvideobridge
    exec-once = wl-paste --type text --watch cliphist store
    exec-once = wl-paste --type image --watch cliphist store

    # scale apps
    exec-once = xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1
    exec-once = echo "Xft.dpi: 130" | xrdb -merge

    # set cursor for HL itself
    exec-once = hyprctl setcursor ${pointer.name} ${toString pointer.size}

    # use this instead of hidpi patches
    xwayland {
      force_zero_scaling = true
    }

    input {
      kb_layout = latam
      follow_mouse = 1
      sensitivity = 0 
      force_no_accel = 1
    }

    misc {
      disable_autoreload = true
      animate_mouse_windowdragging = false
      vrr = 0
      vfr = true
      disable_splash_rendering = true
    }

    general {
      gaps_in = 5
      gaps_out = 5
      border_size = 2
      col.active_border = rgb(${colors.base}) rgb(${colors.mantle}) 270deg
      col.inactive_border = rgb(${colors.crust}) rgb(${colors.mantle}) 270deg
      # group borders
      col.group_border_active = rgb(${colors.pink})
      col.group_border = rgb(${colors.surface0})
      no_border_on_floating = false 
      layout = dwindle
      no_cursor_warps = true
    }

    decoration {
      rounding = 5
      multisample_edges = true

      blur = true
      blur_size = 6
      blur_passes = 3
      blur_new_optimizations = true
      blur_ignore_opacity = true

      drop_shadow = true
      shadow_ignore_window = true
      shadow_offset = 0 5
      shadow_range = 50
      shadow_render_power = 3
      col.shadow = rgba(00000099)

      blurls = gtk-layer-shell
      blurls = waybar
      blurls = lockscreen
    }

    animations {
      enabled = true
      bezier = wind, 0.05, 0.9, 0.1, 1.05
      bezier = winIn, 0.1, 1.1, 0.1, 1.1
      bezier = winOut, 0.3, -0.3, 0, 1
      bezier = liner, 1, 1, 1, 1


      animation = windows, 1, 6, wind, slide
      animation = windowsIn, 1, 6, winIn, slide
      animation = windowsOut, 1, 5, winOut, slide
      animation = windowsMove, 1, 5, wind, slide
      animation = border, 1, 1, liner
      animation = borderangle, 1, 30, liner, loop
      animation = fade, 1, 10, default
      animation = workspaces, 1, 5, wind
    }

    dwindle {
      no_gaps_when_only = false
      pseudotile = true
      preserve_split = true
    }

    master {
      new_is_master = true
    }

    windowrulev2 = opacity 0.90 0.90,class:^(org.wezfurlong.wezterm)$
    windowrulev2 = opacity 0.90 0.90,class:^(Brave-browser)$
    windowrulev2 = opacity 0.90 0.90,class:^(brave-browser)$
    windowrulev2 = opacity 0.80 0.80,class:^(Steam)$
    windowrulev2 = opacity 0.80 0.80,class:^(steam)$
    windowrulev2 = opacity 0.80 0.80,class:^(steamwebhelper)$
    windowrulev2 = opacity 0.80 0.80,class:^(Spotify)$
    windowrulev2 = opacity 0.80 0.80,class:^(Code)$
    windowrulev2 = opacity 0.80 0.80,class:^(thunar)$
    windowrulev2 = opacity 0.80 0.80,class:^(file-roller)$
    windowrulev2 = opacity 0.80 0.80,class:^(nwg-look)$
    windowrulev2 = opacity 0.80 0.80,class:^(qt5ct)$
    windowrulev2 = opacity 0.80 0.80,class:^(discord)$ #Discord-Electron
    windowrulev2 = opacity 0.80 0.80,class:^(WebCord)$ #WebCord-Electron
    windowrulev2 = opacity 0.80 0.70,class:^(pavucontrol)$
    windowrulev2 = opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = opacity 0.80 0.80,class:^(org.telegram.desktop)$

    windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = float,class:^(pavucontrol)$
    windowrulev2 = float,title:^(Media viewer)$
    windowrulev2 = float,title:^(Volume Control)$
    windowrulev2 = float,title:^(Picture-in-Picture)$
    windowrulev2 = float,class:^(Viewnior)$
    windowrulev2 = float,title:^(DevTools)$
    windowrulev2 = float,class:^(file_progress)$
    windowrulev2 = float,class:^(confirm)$
    windowrulev2 = float,class:^(dialog)$
    windowrulev2 = float,class:^(download)$
    windowrulev2 = float,class:^(notification)$
    windowrulev2 = float,class:^(error)$
    windowrulev2 = float,class:^(confirmreset)$
    windowrulev2 = float,title:^(Open File)$
    windowrulev2 = float,title:^(branchdialog)$
    windowrulev2 = float,title:^(Confirm to replace files)$
    windowrulev2 = float,title:^(File Operation Progress)$

    # only allow shadows for floating windows
    windowrulev2 = noshadow, floating:0

    # start spotify tiled in ws9
    windowrulev2 = tile, title:^(Spotify)$
    windowrulev2 = workspace 9 silent, title:^(Spotify)$

    # start Discord/WebCord in ws2
    windowrulev2 = workspace 3, title:^(.*(Disc|WebC)ord.*)$

    # idle inhibit while watching videos
    windowrulev2 = idleinhibit focus, class:^(mpv|.+exe)$
    windowrulev2 = idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$
    windowrulev2 = idleinhibit fullscreen, class:^(firefox)$

    windowrulev2 = idleinhibit fullscreen,class:^(Brave-browser)$

    # fix xwayland apps
    windowrulev2 = rounding 0, xwayland:1, floating:1
    windowrulev2 = center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$
    windowrulev2 = size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$

    layerrule = blur, ^(gtk-layer-shell|anyrun)$
    layerrule = ignorezero, ^(gtk-layer-shell|anyrun)$

    # xwaylandvideobridge
    windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
    windowrulev2 = noanim,class:^(xwaylandvideobridge)$
    windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
    windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$

    $scriptsDir = $HOME/.config/hypr/scripts
    $videoDir = $HOME/Videos
    $notifycmd = notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low
    $bg-dir = $HOME/.wallpapers

    $screenshot = $scriptsDir/screensht
    $colorpicker = $scriptsDir/colorpicker

    bind = $mod, v, exec, wf-recorder -f $videoDir/$(date +'%H:%M:%S_%d-%m-%Y.mp4')
    bind = $mod, v, exec, $notifycmd 'Recording Started ...'
    bind = $mod SHIFT, v, exec, killall -s SIGINT wf-recorder
    bind = $mod SHIFT, v, exec, $notifycmd 'Recording Stopped ...'
    bind = , Print, exec, $screenshot full
    bind = $mod SHIFT, S, exec, $screenshot area

    bind = $mod SHIFT, X, exec, $colorpicker
    bind = $mod, ESCAPE, exec, wlogout -p layer-shell

    bindr = $mod, SUPER_L, exec, pkill .${default.launcher}-wrapped || run-as-service ${default.launcher}
    bind = $mod, Return, exec, run-as-service ${default.terminal.name}
    bind = $mod SHIFT, L, exec, loginctl lock-session

    bind = $mod, Q, killactive,
    bind = $mod SHIFT, Q, exit,
    bind = $mod, F, fullscreen,
    bind = $mod, Space, togglefloating,
    bind = $mod, P, pseudo, # dwindle
    bind = $mod, S, togglesplit, # dwindle

    # Change Workspace Mode
    bind = $mod SHIFT, Space, workspaceopt, allfloat
    bind = $mod SHIFT, Space, exec, $notifycmd 'Toggled All Float Mode'
    bind = $mod SHIFT, P, workspaceopt, allpseudo
    bind = $mod SHIFT, P, exec, $notifycmd 'Toggled All Pseudo Mode'

    bind = $mod, Tab, cyclenext,
    bind = $mod, Tab, bringactivetotop,

    bind = $mod, h, movefocus, l
    bind = $mod, l, movefocus, r
    bind = $mod, k, movefocus, u
    bind = $mod, j, movefocus, d

    bind = $mod SHIFT, left, movewindow, l
    bind = $mod SHIFT, right, movewindow, r
    bind = $mod SHIFT, up, movewindow, u
    bind = $mod SHIFT, down, movewindow, d

    bind = $mod CTRL, left, resizeactive, -20 0
    bind = $mod CTRL, right, resizeactive, 20 0
    bind = $mod CTRL, up, resizeactive, 0 -20
    bind = $mod CTRL, down, resizeactive, 0 20

    bind = $mod, g, togglegroup
    bind = $mod, tab, changegroupactive
    bind = $mod, G, exec, $notifycmd 'Toggled Group Mode'

    bind = $mod, a, togglespecialworkspace
    bind = $mod SHIFT, a, movetoworkspace, special
    bind = $mod, a, exec, $notifycmd 'Toggled Special Workspace'
    bind = $mod, c, exec, hyprctl dispatch centerwindow

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
    bind = $mod, mouse_down, workspace, e+1
    bind = $mod, mouse_up, workspace, e-1

    # workspaces
    # binds mod + [shift +] {1..10} to [move to] ws {1..10}
    ${builtins.concatStringsSep "\n" (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in ''
          bind = $mod, ${ws}, workspace, ${toString (x + 1)}
          bind = $mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
        ''
      )
      10)}
  '';
}
