{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      dev = "$HOME/Dev";
      dots = "$HOME/Dev/nixland";
      pics = "$HOME/Pictures";
      vids = "$HOME/Videos";
    };
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    initExtra = ''
      # search history based on what's typed in the prompt
      autoload -U history-search-end
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      bindkey "^[OA" history-beginning-search-backward-end
      bindkey "^[OB" history-beginning-search-forward-end

      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-colors '\'
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true
      _comp_options+=(globdots)

      export PATH=${config.home.homeDirectory}/.local/bin:${config.home.homeDirectory}/.local/share/nvim/mason/bin:$PATH

      ${lib.optionalString config.services.gpg-agent.enable ''
        gnupg_path=$(ls $XDG_RUNTIME_DIR/gnupg)
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/$gnupg_path/S.gpg-agent.ssh"
      ''}

      ${lib.optionalString config.programs.kitty.enable ''
        if test -n "$KITTY_INSTALLATION_DIR"; then
          export KITTY_SHELL_INTEGRATION="enabled"
          autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
          kitty-integration
          unfunction kitty-integration
        fi
      ''}

      # run programs that are not in PATH with comma
      command_not_found_handler() {
        ${pkgs.comma}/bin/comma "$@"
      }
    '';

    shellAliases = {
      installed = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq | sk";
      installedall = "nix-store --query --requisites /run/current-system | sk";
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      forceclean = "sudo nix-collect-garbage -d";
      nixremove = "nix-store --gc";
      bloat = "nix path-info -Sh /run/current-system";
      c = "clear";
      q = "exit";
      cleanram = "sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'";
      trimall = "sudo fstrim -va";
      temp = "cd /tmp/";

      test-build = "sudo nixos-rebuild test --flake .#aesthetic";
      switch-build = "sudo nixos-rebuild switch --flake .#aesthetic";

      # git
      g = "git";
      commit = "git add . && git commit -m";
      push = "git push";
      pull = "git pull";
      gcld = "git clone --depth";
      gco = "git checkout";
      gitgrep = "git ls-files | grep";
      gitrm = "git ls-files --deleted -z | xargs -0 git rm";

      m = "mkdir -p";
      fcd = "cd $(find -type d | fzf)";
      # grep = "ripgrep";
      du = "du-dust";
      ps = "procs";
      # rm = "trash-cli";
      cat = "bat --style=plain";
      l = "eza -lF --time-style=long-iso --icons";
      la = "eza -lah --tree";
      ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
      tree = "eza --tree --icons --tree";

      # myself
      run = "pnpm run";
    };
    shellGlobalAliases = {eza = "eza --icons --git";};
  };
}
