{
  inputs,
  pkgs,
  ...
}: {
  imports = [./languages.nix];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default.overrideAttrs (self: {
      makeWrapperArgs = with pkgs;
        self.makeWrapperArgs
        or []
        ++ [
          "--suffix"
          "PATH"
          ":"
          (lib.makeBinPath [
            inputs.self.packages.${pkgs.system}.biome
            emmet-ls
            marksman
            nil
            nodePackages.volar
            nodePackages.vscode-css-languageserver-bin
            nodePackages.vscode-langservers-extracted
            nodePackages.typescript-language-server
            nodePackages."@astrojs/language-server"
            typescript
          ])
        ];
    });

    themes = {
      tokyonight_transparent = {
        "inherits" = "tokyonight";
        "ui.virtual.inlay-hint" = {
          modifiers = ["italic"];
        };
        "ui.background" = "{}";
        "ui.text" = "{}";
      };
    };

    settings = {
      theme = "tokyonight_transparent";
      editor = {
        color-modes = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        bufferline = "always";
        true-color = true;
        soft-wrap.enable = true;
        indent-guides = {
          render = true;
          rainbow-option = "dim";
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];
        statusline = {
          left = ["mode" "selections" "spinner" "file-name" "total-line-numbers"];
          center = [];
          right = ["diagnostics" "file-encoding" "file-line-ending" "file-type" "position-percentage" "position"];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        whitespace.characters = {
          space = "·";
          nbsp = "⍽";
          tab = "→";
          newline = "⤶";
        };
      };

      keys.insert = {
        C-h = "move_char_left";
        C-j = "move_line_down";
        C-k = "move_line_up";
        C-l = "move_char_right";
        C-e = "goto_line_end";
        C-b = "goto_line_start";
      };

      keys.normal = {
        A-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
        A-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        A-h = ["delete_selection" "move_char_left" "paste_before"];
        A-l = ["delete_selection" "move_char_right" "paste_after"];

        C-h = ["jump_view_left"];
        C-j = ["jump_view_down"];
        C-k = ["jump_view_up"];
        C-l = ["jump_view_right"];

        tab = ["goto_next_buffer"];
        S-tab = ["goto_previous_buffer"];

        space = {x = ":buffer-close";};

        space.u = {
          f = ":format"; # format using LSP formatter
          w = ":set whitespace.render all";
          W = ":set whitespace.render none";
        };
      };
    };
  };
}
