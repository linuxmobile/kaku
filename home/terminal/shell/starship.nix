{
  config,
  default,
  ...
}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$fill$git_branch$git_status$cmd_duration$line_break$character";

      character = {
        success_symbol = "[](bold ${default.xcolors.color4})";
        error_symbol = "[](bold ${default.xcolors.color9})";
      };

      directory = {
        format = "[]($style)[  ](bg:${default.xcolors.darker} fg:${default.xcolors.color4})[$path](bg:${default.xcolors.darker} fg:${default.xcolors.color7} bold)[ ]($style)";
        style = "bg:none fg:${default.xcolors.darker}";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      git_branch = {
        format = "[]($style)[[  ](bg:${default.xcolors.darker} fg:${default.xcolors.color7} bold)$branch](bg:${default.xcolors.darker} fg:${default.xcolors.color7})[ ]($style)";
        style = "bg:none fg:${default.xcolors.darker}";
      };

      git_status = {
        format = "[]($style)[$all_status$ahead_behind](bg:${default.xcolors.darker} fg:${default.xcolors.color7} bold)[ ]($style)";
        style = "bg:none fg:${default.xcolors.darker}";
        conflicted = "=";
        ahead = "⇡$\{count\}";
        behind = "⇣$\{count\} ";
        diverged = "↑$\{ahead_count\} ⇣$\{behind_count\} ";
        up_to_date = " ";
        untracked = "?$\{count\} ";
        stashed = " ";
        modified = "!$\{count\} ";
        staged = "+$\{count\} ";
        renamed = "»$\{count\} ";
        deleted = " $\{count\} ";
      };

      cmd_duration = {
        min_time = 1;
        format = "[]($style)[[  ](bg:${default.xcolors.darker} fg:${default.xcolors.color4} bold)$duration](bg:${default.xcolors.darker} fg:${default.xcolors.color7} bold)[]($style)";
        disabled = false;
        style = "bg:none fg:${default.xcolors.darker}";
      };

      nix_shell = {
        symbol = " ";
        heuristic = true;
      };
    };
  };
}
