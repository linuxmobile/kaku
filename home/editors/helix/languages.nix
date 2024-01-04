{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = let
      deno = lang: {
        command = "${pkgs.deno}/bin/deno";
        args = ["fmt" "-" "--ext" lang];
      };
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
        {
          name = "javascript";
          auto-format = true;
          language-servers = ["deno-lsp"];
        }
        {
          name = "json";
          formatter = deno "json";
        }
        {
          name = "markdown";
          auto-format = true;
          formatter = deno "md";
        }
        {
          name = "typescript";
          auto-format = true;
          language-servers = ["deno-lsp"];
        }
        {
          name = "astro";
          auto-format = true;
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--parser" "astro"];
          };
          language-servers = ["astro-lsp" "emmet-lsp"];
        }
      ]
      ++ prettierLangs langs;

    language-server = {
      astro-lsp = {
        command = "astro-ls";
        args = ["--stdio"];
        file-types = ["astro"];
        config.typescript.tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib/";
      };

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      deno-lsp = {
        command = "${pkgs.deno}/bin/deno";
        args = ["lsp"];
        environment.NO_COLOR = "1";
        config.deno = {
          enable = true;
          lint = true;
          unstable = true;
          suggest = {
            completeFunctionCalls = false;
            imports = {hosts."https://deno.land" = true;};
          };
          inlayHints = {
            enumMemberValues.enabled = true;
            functionLikeReturnTypes.enabled = true;
            parameterNames.enabled = "all";
            parameterTypes.enabled = true;
            propertyDeclarationTypes.enabled = true;
            variableTypes.enabled = true;
          };
        };
      };

      emmet-lsp = {
        command = "${pkgs.emmet-ls}/bin/emmet-ls";
        args = ["--stdio"];
      };

      vscode-css-language-server = {
        command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
        args = ["--stdio"];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
          scss.validate.enable = true;
        };
      };

      unocss-lsp = {
        command = "unocss-language-server";
        args = ["--stdio"];
      };
    };
  };
}
