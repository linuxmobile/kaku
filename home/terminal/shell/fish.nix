{pkgs, ...}: {
  home.packages = with pkgs; [grc];
  programs = {
    carapace = {
      enable = true;
      enableFishIntegration = true;
    };
    fish = {
      enable = true;

      shellInit = ''
        set -gx NIXPKGS_ALLOW_UNFREE 1
        set -gx NIXPKGS_ALLOW_INSECURE 1
        set -gx EDITOR hx
        set -gx VISUAL hx

        set -g fish_greeting
      '';

      interactiveShellInit = ''
        # Completion bridges
        set -Ux CARAPACE_BRIDGES 'inshellisense,fish,bash'

        # Vi keybindings
        fish_vi_key_bindings

        # Custom binding
        for mode in insert default
          bind -M $mode ctrl-backspace backward-kill-word
          bind -M $mode ctrl-z undo
          bind -M $mode ctrl-b beginning-of-line
          bind -M $mode ctrl-e end-of-line
        end

        # History search with prefix (like nushell)
        bind -M insert up history-prefix-search-backward
        bind -M insert down history-prefix-search-forward

        # Same for normal mode
        bind -M default up history-prefix-search-backward
        bind -M default down history-prefix-search-forward

        # Cursor shapes per mode
        set fish_cursor_default block
        set fish_cursor_insert line
        set fish_cursor_replace_one underscore
        set fish_cursor_visual block

        # Syntax colors
        set -g fish_color_autosuggestion brblack
        set -g fish_color_command blue
        set -g fish_color_error red
        set -g fish_color_param normal

        # Path
        fish_add_path ~/.local/bin

        # Search highlight
        set -g fish_color_search_match --background=normal

        # Plugin settings
        set -Ux fifc_editor hx
        set -U fifc_keybinding \cx
        set -g __done_min_cmd_duration 10000
        set -g sudope_sequence \cs

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
        koji = "meteor";
        gitui = "lazygit";

        l = "eza -lF --time-style=long-iso --icons";
        ll = "eza -h --git --icons --color=auto --group-directories-first -s extension";
        tree = "eza --tree --icons --tree";
        cat = "${pkgs.bat}/bin/bat --paging=never";
        moon = "${pkgs.curlMinimal}/bin/curl -s wttr.in/Moon";
        weather = "${pkgs.curlMinimal}/bin/curl -s wttr.in";
        store-path = "${pkgs.coreutils-full}/bin/readlink (${pkgs.which}/bin/which $argv)";

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
        {
          name = "grc";
          src = grc.src;
        }
        {
          name = "puffer";
          src = puffer.src;
        }
      ];
    };
  };
}
