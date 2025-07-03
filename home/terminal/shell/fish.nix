{pkgs, ...}: {
  programs.fish = {
    enable = true;

    shellInit = ''
      set -gx NIXPKGS_ALLOW_UNFREE 1
      set -gx NIXPKGS_ALLOW_INSECURE 1
      set -gx EDITOR hx
      set -gx VISUAL hx

      set -g fish_greeting
    '';

    interactiveShellInit = ''
      fish_vi_key_bindings
      set fish_cursor_default block
      set fish_cursor_insert line
      set fish_cursor_replace_one underscore
      set fish_cursor_visual block

      set -g fish_color_autosuggestion brblack
      set -g fish_color_command blue
      set -g fish_color_error red
      set -g fish_color_param normal

      fish_add_path ~/.local/bin
      set -g fish_color_search_match --background=normal
    '';

    functions = {
      fcd = ''
        set -l dir (fd --type d | sk | string trim)
        if test -n "$dir"
          cd $dir
        end
      '';

      installed = ''
        nix-store --query --requisites /run/current-system/ | string replace -r '.*?-(.*)' '$1' | sort | uniq | sk
      '';

      installedall = ''
        nix-store --query --requisites /run/current-system/ | sk | wl-copy
      '';

      search = ''
        if test (count $argv) -eq 0
          echo "Usage: search [package name]"
          return 1
        end

        set query (string replace " " "+" $argv[1])
        set url "https://searchix.alanpearce.eu/packages/nixpkgs/search?query=$query"

        echo "Searching for packages matching '$argv[1]'..."
        echo ""

        set html_content (curl -s "$url")
        if test -z "$html_content"
          echo "Error: Could not fetch results from searchix.alanpearce.eu"
          return 1
        end

        printf "%s%-40s %s%-20s %s%-60s%s\n" \
          (set_color --bold blue) "ATTRIBUTE" \
          (set_color --bold green) "NAME" \
          (set_color --bold yellow) "DESCRIPTION" \
          (set_color normal)

        echo "----------------------------------------------------------------------------------------------"

        set attributes (echo $html_content | ${pkgs.htmlq}/bin/htmlq -t "table tbody tr td:nth-child(1) a")
        set names (echo $html_content | ${pkgs.htmlq}/bin/htmlq -t "table tbody tr td:nth-child(2)")
        set descriptions (echo $html_content | ${pkgs.htmlq}/bin/htmlq -t "table tbody tr td.description")

        set total_count (count $attributes)

        if test $total_count -eq 0
          echo "No matching packages found."
          return 0
        end

        for i in (seq $total_count)
          printf "%s%-40s %s%-20s %s%-60s%s\n" \
            (set_color blue) (string sub -l 39 $attributes[$i]) \
            (set_color green) (string sub -l 19 $names[$i]) \
            (set_color yellow) (string sub -l 59 $descriptions[$i]) \
            (set_color normal)
        end

        set results_info (echo $html_content | ${pkgs.htmlq}/bin/htmlq -t "footer span[role=status]")

        echo ""
        echo $results_info
        echo "For more details, visit: $url"
      '';

      homesearch = ''
        if test (count $argv) -eq 0
          echo "Usage: homesearch [program name]"
          return 1
        end

        set tmp_file (mktemp)

        echo "Searching for options matching '$argv[1]'..."
        echo ""

        curl -s https://raw.githubusercontent.com/mipmip/home-manager-option-search/refs/heads/main/static/data/options-release-24.05.json | \
        jq -r --arg TERM $argv[1] '
          .options[]? |
          select(
            (.title | contains($TERM)) or
            (if has("declarations") then
              (.declarations[]? | .name | contains($TERM))
             else
              false
             end)
          ) |
          {
            title: .title,
            type: (if .type == "" or .type == null then "No type" else
                   if (.type | length) > 20 then (.type[0:17] + "...") else .type end
                   end),
            default: (if .default == "" or .default == null then "null" else
                      if (.default | length) > 15 then (.default[0:12] + "...") else .default end
                      end),
            module: (if has("declarations") and (.declarations | length > 0) then
                      (
                        .declarations[0].name |
                        split(">")[0] |
                        split("<")[1] |
                        split("home-manager/modules/")[1] // .
                      )
                      else "unknown" end)
          } | [.title, .type, .default, .module] | @tsv' > $tmp_file

        printf "%s%-35s %s%-25s %s%-15s %s%-20s%s\n" \
          (set_color --bold blue) "OPTION" \
          (set_color --bold green) "TYPE" \
          (set_color --bold yellow) "DEFAULT" \
          (set_color --bold magenta) "MODULE" \
          (set_color normal)

        echo "----------------------------------------------------------------------------------------------"

        if test (stat -c%s $tmp_file) -eq 0
          echo "No matching options found."
          rm $tmp_file
          return 0
        end

        cat $tmp_file | while read -l line
          set parts (string split \t $line)
          printf "%s%-35s %s%-25s %s%-15s %s%-20s%s\n" \
            (set_color blue) (string sub -l 34 $parts[1]) \
            (set_color green) (string sub -l 24 $parts[2]) \
            (set_color yellow) (string sub -l 14 $parts[3]) \
            (set_color magenta) (string sub -l 19 $parts[4]) \
            (set_color normal)
        end

        echo ""
        echo "For detailed information, use: homesearch \"exact.option.name\""

        rm $tmp_file
      '';

      fm = ''
        set -l tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file $tmp
        set -l cwd (cat $tmp)
        if test -n "$cwd" -a "$cwd" != "$PWD"
          cd $cwd
        end
        rm -f $tmp
      '';

      gitgrep = ''
        git ls-files | rg $argv
      '';
    };

    shellAbbrs = {
      z = "zoxide query";
      zi = "zoxide query -i";
    };

    shellAliases = {
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      nixremove = "nix-store --gc";
      bloat = "nix path-info -Sh /run/current-system";
      cleanram = "sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'";
      trimall = "sudo fstrim -va";

      c = "clear";
      q = "exit";
      temp = "cd /tmp/";

      test-build = "sudo nixos-rebuild test --flake .#aesthetic";
      switch-build = "sudo nixos-rebuild switch --flake .#aesthetic";

      add = "git add .";
      commit = "git commit";
      push = "git push";
      pull = "git pull";
      diff = "git diff --staged";
      gcld = "git clone --depth 1";

      l = "eza -lF --time-style=long-iso --icons";
      ll = "eza -h --git --icons --color=auto --group-directories-first -s extension";
      tree = "eza --tree --icons --tree";

      us = "systemctl --user";
      rs = "sudo systemctl";

      zed = "zeditor";
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "autopair";
        src = autopair.src;
      }
      {
        name = "done";
        src = done.src;
      }
      {
        name = "bass";
        src = bass.src;
      }
      {
        name = "colored-man-pages";
        src = colored-man-pages.src;
      }
      {
        name = "fish-you-should-use";
        src = fish-you-should-use.src;
      }
      {
        name = "plugin-git";
        src = plugin-git.src;
      }
      {
        name = "plugin-sudope";
        src = plugin-sudope.src;
      }
      {
        name = "humantime-fish";
        src = humantime-fish.src;
      }
      {
        name = "fifc";
        src = fifc.src;
      }
    ];
  };
}
