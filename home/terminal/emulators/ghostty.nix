_: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    clearDefaultKeybinds = true;
    settings = {
      theme = "noctalia";

      scrollback-limit = 10000;

      font-family = "Cozette";
      font-size = 10;
      cursor-style = "bar";
      cursor-style-blink = true;
      window-padding-x = 15;
      window-padding-y = 6;
      desktop-notifications = true;
      resize-overlay = "never";
      window-decoration = "none";
      bell-features = "audio";

      confirm-close-surface = false;
      gtk-single-instance = true;
      quit-after-last-window-closed = false;
      # initial-window = false;

      adjust-cursor-height = "40%";
      adjust-cursor-thickness = "100%";
      adjust-box-thickness = "100%";
      adjust-underline-thickness = "100%";
      adjust-underline-position = "110%";
      keybind = [
        "ctrl+shift+d=inspector:toggle"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+minus=decrease_font_size:1"
        "ctrl+shift+plus=increase_font_size:1"
        "ctrl+shift+0=reset_font_size"
        "ctrl+shift+r=reload_config"
        "alt+v=new_split:right"
        "alt+s=new_split:down"
        "alt+h=goto_split:left"
        "alt+l=goto_split:right"
        "alt+j=goto_split:bottom"
        "alt+k=goto_split:top"
        "alt+n=new_tab"
      ];
    };
  };
}
