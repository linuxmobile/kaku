_: let
  windowRules = [
    {
      geometry-corner-radius = let
        radius = 12.0;
      in {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
    {
      matches = [
        {is-floating = true;}
      ];
      shadow.enable = true;
    }
    {
      matches = [
        {
          is-window-cast-target = true;
        }
      ];
      focus-ring = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
      border = {
        inactive.color = "#7d0d2d";
      };
      shadow = {
        color = "#7d0d2d70";
      };
      tab-indicator = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
    }
    {
      matches = [{app-id = "org.telegram.desktop";}];
      block-out-from = "screencast";
    }
    {
      matches = [{app-id = "app.drey.PaperPlane";}];
      block-out-from = "screencast";
    }
    {
      matches = [
        {app-id = "zen";}
        {app-id = "helium";}
        {app-id = "firefox";}
        {app-id = "chromium-browser";}
        {app-id = "xdg-desktop-portal-gtk";}
      ];
      scroll-factor = 0.6;
    }
    {
      matches = [
        {app-id = "zen";}
        {app-id = "helium";}
        {app-id = "firefox";}
        {app-id = "chromium-browser";}
        {app-id = "edge";}
      ];
      open-maximized = true;
    }
    {
      matches = [
        {
          title = "^Picture-in-Picture$";
        }
      ];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
      default-column-width = {fixed = 480;};
      default-window-height = {fixed = 270;};
    }

    {
      matches = [{title = "Discord Popout";}];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
    }

    {
      matches = [
        {app-id = "Multiviewer";}
        {title = "^Track Map$";}
      ];
      open-floating = true;
      default-floating-position = {
        x = 1426;
        y = 747;
        relative-to = "top-right";
      };
      default-column-width = {fixed = 490;};
      default-window-height = {fixed = 330;};
      open-on-output = "HDMI-A-1";
    }
    {
      matches = [
        {app-id = "Multiviewer";}
        {title = "^Replay Radio$";}
      ];
      open-floating = true;
      default-floating-position = {
        x = 1423;
        y = 301;
        relative-to = "top-right";
      };
      default-column-width = {fixed = 500;};
      default-window-height = {fixed = 450;};
      open-on-output = "HDMI-A-1";
    }
    {
      matches = [
        {app-id = "Multiviewer";}
        {title = "^Franco Colapinto$";}
      ];
      open-floating = true;
      default-floating-position = {
        x = 637;
        y = -2;
        relative-to = "top-right";
      };
      default-column-width = {fixed = 640;};
      default-window-height = {fixed = 360;};
      open-on-output = "HDMI-A-1";
    }
    {
      matches = [
        {app-id = "Multiviewer";}
        {title = "^Pierre Gasly$";}
      ];
      open-floating = true;
      default-floating-position = {
        x = -2;
        y = -2;
        relative-to = "top-right";
      };
      default-column-width = {fixed = 640;};
      default-window-height = {fixed = 360;};
      open-on-output = "HDMI-A-1";
    }
    {
      matches = [
        {app-id = "Multiviewer";}
        {title = "^Kimi Antonelli$";}
      ];
      open-floating = true;
      default-floating-position = {
        x = 1278;
        y = -2;
        relative-to = "top-right";
      };
      default-column-width = {fixed = 640;};
      default-window-height = {fixed = 360;};
      open-on-output = "HDMI-A-1";
    }
    {
      matches = [
        {app-id = "Multiviewer";}
        {title = "^Live Timing$";}
      ];
      open-floating = true;
      default-floating-position = {
        x = 1430;
        y = 710;
        relative-to = "bottom-left";
      };
      default-column-width = {fixed = 1430;};
      default-window-height = {fixed = 710;};
      open-on-output = "HDMI-A-1";
    }

    {
      matches = [{app-id = "pavucontrol";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "pavucontrol-qt";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "com.saivert.pwvucontrol";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "io.github.fsobolev.Cavalier";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "dialog";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "popup";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "task_dialog";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "gcr-prompter";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "file-roller";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "org.gnome.FileRoller";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "nm-connection-editor";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "blueman-manager";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "xdg-desktop-portal-gtk";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "org.kde.polkit-kde-authentication-agent-1";}];
      open-floating = true;
    }
    {
      matches = [{app-id = "pinentry";}];
      open-floating = true;
    }
    {
      matches = [{title = "Progress";}];
      open-floating = true;
    }
    {
      matches = [{title = "File Operations";}];
      open-floating = true;
    }
    {
      matches = [{title = "Copying";}];
      open-floating = true;
    }
    {
      matches = [{title = "Moving";}];
      open-floating = true;
    }
    {
      matches = [{title = "Properties";}];
      open-floating = true;
    }
    {
      matches = [{title = "Downloads";}];
      open-floating = true;
    }
    {
      matches = [{title = "file progress";}];
      open-floating = true;
    }
    {
      matches = [{title = "Confirm";}];
      open-floating = true;
    }
    {
      matches = [{title = "Authentication Required";}];
      open-floating = true;
    }
    {
      matches = [{title = "Notice";}];
      open-floating = true;
    }
    {
      matches = [{title = "Warning";}];
      open-floating = true;
    }
    {
      matches = [{title = "Error";}];
      open-floating = true;
    }
  ];
in {
  programs.niri.settings = {
    window-rules = windowRules;
    layout = {
      background-color = "transparent";
    };
    layer-rules = [
      {
        matches = [{namespace = "^noctalia-wallpaper*";}];
        place-within-backdrop = true;
      }
    ];
  };
}
