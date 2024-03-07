{config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      format = ''
        $os$directory$character
      '';
      right_format = ''
        ($nix_shell) $git_branch $git_status
      '';
      scan_timeout = 10;
      line_break.disabled = true;

      os = {
        format = "[](fg:#7DAEA3 bg:none)[$symbol]($style)[](fg:#7DAEA3 bg:#26243C)";
        symbols.NixOS = "󰊠 ";
        style = "fg:#131313 bg:#7DAEA3";
        disabled = false;
      };

      directory = {
        format = "[](fg:#26243C bg:#26243C)[󰉋 ](fg:#D8A657 bg:#26243C)[ $path ](fg:#D8A657 bg:#26243C)[](fg:#26243C bg:none)";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      git_branch = {
        format = "[](fg:#A9B665 bg:none)[](fg:#131313 bg:#A9B665)[](fg:#A9B665 bg:#A9B665)[$branch ](fg:#131313 bg:#A9B665)[](fg:#A9B665 bg:none)";
      };

      git_status = {
        format = "[](fg:#232526 bg:none)[$all_status $ahead_behind]($style)[](fg:#232526 bg:#232526)[](fg:#67afc1 bg:#232526)[  ](fg:#232526 bg:#67afc1)[](fg:#67afc1 bg:none)";
        style = "fg:#D4BE98 bg:#232526";
        conflicted = "=";
        ahead = "⇡$\{count\}";
        behind = "⇣$\{count\}";
        diverged = "⇕⇡$\{ahead_count\}⇣$\{behind_count\}";
        up_to_date = "";
        untracked = "?$\{count\}";
        stashed = "";
        modified = "!$\{count\}";
        staged = "+$\{count\}";
        renamed = "»$\{count\}";
        deleted = "$\{count\}";
      };

      character = {
        success_symbol = "[ 󱐋 ](bold yellow)";
        error_symbol = "[ 󱐋 ](bold red)";
        vicmd_symbol = "[  ](bold green)";
      };

      nix_shell = {
        impure_msg = "";
        symbol = " ";
        heuristic = true;
        format = "[($name \\(develop\\)) ]($style)[](fg:#7DAEA3 bg:none)[$symbol](fg:#131313 bg:#7DAEA3)[](fg:#7DAEA3 bg:none)";
      };

      shlvl = {
        format = "[$shlvl]($style) ";
        style = "bold cyan";
        threshold = 2;
        repeat = true;
        disabled = false;
      };
    };
  };
}
