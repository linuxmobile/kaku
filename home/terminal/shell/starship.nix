{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = true;

      format = ''
        [╭──╼](bold blue) $hostname $os
        [┆](bold blue) $directory$git_branch$git_commit$git_state$git_metrics$git_status$nix_shell
        [╰─>](bold blue) $character
      '';

      # right_format = ''$cmd_duration ($character) at ❗$time'';

      os = {
        format = "on [($name $codename$version $symbol )]($style)";
        style = "bold blue";
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold red";
        disabled = false;
      };

      character = {
        format = "$symbol";
        success_symbol = "[❯](bold green)";
        error_symbol = "[✗](bold red) ";
        disabled = false;
      };

      time = {
        disabled = false;
        format = " [$time]($style)";
        time_format = "%H:%M";
        utc_time_offset = "local";
        style = "pale blue";
      };

      cmd_duration = {
        disabled = false;
        min_time = 250;
        show_milliseconds = false;
        show_notifications = false;
        format = "was [$duration](bold green)";
      };

      nix_shell = {
        disabled = false;
        heuristic = false;
        format = "[   ](fg:blue bold)";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };
    };
  };
}
