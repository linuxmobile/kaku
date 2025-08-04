{
  # https://docs.atuin.sh/configuration/config/
  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      auto_sync = false;
      update_check = false;
      workspaces = false;
      ctrl_n_shortcuts = true;
      dialect = "uk";
      filter_mode = "host";
      search_mode = "skim";
      filter_mode_shell_up_key_binding = "session";
      style = "compact";
      inline_height = 7;
      show_help = false;
      enter_accept = true;
      history_filter = ["shit"];
      keymap_mode = "vim-normal";
      sync = {
        records = true;
      };
    };
  };
}
