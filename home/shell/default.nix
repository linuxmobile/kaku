{ config, ... }: {
  imports =
    [ ./cli.nix ./starship.nix ./transient-services.nix ./zsh.nix ./nix.nix ];

  # add environment variables
  home.sessionVariables = {
    # clean up ~
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    EDITOR = "nvim";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    DIRENV_LOG_FORMAT = "";
  };
}
