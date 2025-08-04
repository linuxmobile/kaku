{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      format = "$directory$nix_shell$fill$git_branch$git_status$cmd_duration$line_break$character";
      add_newline = false;
      c.disabled = true;
      cmake.disabled = true;
      haskell.disabled = true;
      python.disabled = true;
      ruby.disabled = true;
      rust.disabled = true;
      perl.disabled = true;
      package.disabled = true;
      lua.disabled = true;
      nodejs.disabled = true;
      java.disabled = true;
      golang.disabled = true;

      fill = {
        symbol = " ";
      };
      conda = {
        format = " [ $symbol$environment ] (dimmed green) ";
      };
      character = {
        success_symbol = "[ ](white bold)";
        error_symbol = "[ ](red bold)";
        vicmd_symbol = "[ ](white bold)";
      };
      directory = {
        format = "[█]($style)[ ](bg:black fg:white)[$path](bg:black fg:bright purple bold)[█ ]($style)";
        style = "bg:none fg:black";
        truncation_length = 3;
        truncate_to_repo = false;
      };
      git_branch = {
        format = "[█]($style)[[ ](bg:black fg:red bold)$branch](bg:black fg:white bold)[█ ]($style)";
        style = "bg:none fg:black";
      };
      git_status = {
        format = "[█]($style)[$all_status$ahead_behind](bg:black fg:yellow bold)[█ ]($style)";
        style = "bg:none fg:black";
        conflicted = "=";
        ahead = "[⇡\${count} ](fg:green bg:black) ";
        behind = "[⇣\${count} ](fg:red bg:black)";
        diverged = "↑\${ahead_count} ⇣\${behind_count} ";
        up_to_date = "[](fg:green bg:black)";
        untracked = "[?\${count} ](fg:yellow bg:black) ";
        stashed = "";
        modified = "[~\${count} ](fg:yellow bg:black)";
        staged = "[+\${count} ](fg:green bg:black) ";
        renamed = "[󰑕\${count} ](fg:red bg:black)";
        deleted = "[ \${count} ](fg:red bg:black) ";
      };
      cmd_duration = {
        min_time = 1;
        # duration & style ;
        format = "[█]($style)[[ ](bg:black fg:red bold)$duration](bg:black fg:white bold)[█]($style)";
        disabled = false;
        style = "bg:none fg:black";
      };
      nix_shell = {
        disabled = false;
        heuristic = false;
        format = "[█]($style)[ ](bg:black fg:white bold)[█]($style)";
        style = "bg:none fg:black";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };
    };
  };
}
