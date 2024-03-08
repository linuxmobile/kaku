{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = let
      biome = lang: {
        command = "biome";
        args = ["format" lang];
      };
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

      commonAutoPairs = {
        "(" = ")";
        "{" = "}";
        "[" = "]";
        "<" = ">";
        "'" = "'";
        "\"" = "\"";
      };
    in
      [
        {
          name = "astro";
          auto-format = true;
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--parser" "astro"];
          };
          language-servers = ["astro-lsp" "emmet-lsp"];
          auto-pairs = commonAutoPairs;
        }
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = ["-i" "2"];
          };
          auto-pairs = commonAutoPairs;
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.js"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
          auto-pairs = commonAutoPairs;
        }
        {
          name = "json";
          formatter = biome "json";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
          auto-pairs = commonAutoPairs;
        }
        {
          name = "jsx";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.jsx"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
          auto-pairs = commonAutoPairs;
        }
        {
          name = "markdown";
          auto-format = true;
          formatter = deno "md";
          auto-pairs = commonAutoPairs;
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.ts"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
          auto-pairs = commonAutoPairs;
        }
        {
          name = "tsx";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.tsx"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
          auto-pairs = commonAutoPairs;
        }
        {
          name = "vue";
          roots = ["package.json" "vue.config.js" "vue.config.ts"];
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.vue"];
          };
          language-servers = [
            {
              name = "volar";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
          auto-pairs = commonAutoPairs;
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

      biome-lsp = {
        command = "biome";
        args = ["lsp-proxy"];
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

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      unocss-lsp = {
        command = "unocss-language-server";
        args = ["--stdio"];
      };

      volar = {
        command = "vue-language-server";
        args = ["--stdio"];
        config.typescript.tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib/";
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
    };
  };
}
