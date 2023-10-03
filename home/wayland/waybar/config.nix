_: {
  mainBar = {
    position = "top";
    layer = "top";
    height = 12;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = ["custom/launcher" "custom/playerctl" "custom/playerlabel"];
    modules-center = [
      "hyprland/workspaces"
      # "cpu"
      # "memory"
      # "disk"
    ];

    modules-right = [
      "tray"
      "pulseaudio"
      "clock"
    ];

    clock = {
      format = "󱑍 {:%H:%M}";
      tooltip = false;
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>'';
      format-alt = " {:%d/%m}";
    };

    "hyprland/workspaces" = {
      active-only = false;
      all-outputs = true;
      disable-scroll = false;
      on-scroll-up = "hyprctl dispatch workspace e-1";
      on-scroll-down = "hyprctl dispatch workspace e+1";
      on-click = "activate";
      show-special = "false";
      sort-by-number = true;
      persistent_workspaces = {
        "*" = 10;
      };
    };

    "image" = {
      exec = "bash ~/.scripts/album_art.sh";
      size = 18;
      interval = 10;
    };

    "custom/playerctl" = {
      format = "{icon}";
      return-type = "json";
      max-length = 25;
      exec = ''
        playerctl -a metadata --format '{"text": "{{artist}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';
      on-click-middle = "playerctl play-pause";
      on-click = "playerctl previous";
      on-click-right = "playerctl next";
      format-icons = {
        Playing = "<span foreground='#6791eb'>󰓇 </span>";
        Paused = "<span foreground='#cdd6f4'>󰓇 </span>";
      };
      tooltip = false;
    };

    "custom/playerlabel" = {
      format = "<span>{}</span>";
      return-type = "json";
      max-length = 25;
      exec = ''
        playerctl -a metadata --format '{"text": "{{artist}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';
      on-click-middle = "playerctl play-pause";
      on-click = "playerctl previous";
      on-click-right = "playerctl next";
      format-icons = {
        Playing = "<span foreground='#6791eb'>󰓇 </span>";
        Paused = "<span foreground='#cdd6f4'>󰓇 </span>";
      };
      tooltip = false;
    };

    memory = {
      format = "󰍛 {}%";
      format-alt = "󰍛 {used}/{total} GiB";
      interval = 30;
    };

    cpu = {
      format = "󰻠 {usage}%";
      format-alt = "󰻠 {avg_frequency} GHz";
      interval = 10;
    };

    disk = {
      format = "󰋊 {}%";
      format-alt = "󰋊 {used}/{total} GiB";
      interval = 30;
      path = "/";
    };

    tray = {
      icon-size = 18;
      spacing = 10;
      tooltip = false;
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "";
      format-icons = {default = ["" "" ""];};
      on-click = "bash ~/.scripts/volume mute";
      on-scroll-up = "bash ~/.scripts/volume up";
      on-scroll-down = "bash ~/.scripts/volume down";
      scroll-step = 5;
      on-click-right = "pavucontrol";
      tooltip = false;
    };

    "custom/launcher" = {
      format = "";
      size = 18;
      # on-click = "notify-send -t 1 'swww' '1' & ~/.config/hypr/scripts/wall";
      tooltip = false;
    };
  };
}
