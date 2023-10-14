{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = let
      prettier = lang: {
        command = "${pkgs.nodePackages.prettier}/bin/prettier";
        args = ["--parser" lang];
      };
      prettierLangs = map (e: {
        name = e;
        formatter = prettier e;
      });
      langs = ["css" "scss" "json" "html"];
    in
      [
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = ["-i" "2"];
          };
        }
      ]
      ++ prettierLangs langs;

    language-server = {
      bash-language-server = {
        command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
        args = ["start"];
      };

      clangd = {
        command = "${pkgs.clang-tools}/bin/clangd";
        clangd.fallbackFlags = ["-std=c++2b"];
      };

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      vscode-css-language-server = {
        command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
        args = ["--stdio"];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
        };
      };
    };
  };
}
