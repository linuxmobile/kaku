{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = [
      {
        name = "bash";
        auto-format = true;
        formatter = {
          command = "${pkgs.shfmt}/bin/shfmt";
          args = ["-i" "2"];
        };
      }
      {
        name = "go";
        auto-format = true;
        formatter = {
          command = "${pkgs.gosimports}/bin/goimports";
          args = [];
        };
        language-servers = ["gopls"];
      }
      {
        name = "yaml";
        auto-format = true;
        formatter = {
          command = "${pkgs.nodePackages.prettier}/bin/prettier";
          args = ["--parser" "yaml"];
        };
        language-servers = ["yaml-language-server"];
      }
      {
        name = "astro";
        auto-format = true;
        formatter = {
          command = "${pkgs.nodePackages.prettier}/bin/prettier";
          args = ["--parser" "astro"];
        };
        language-servers = ["astro-ls"];
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
      }
      {
        name = "json";
        formatter = {
          command = "biome";
          args = ["format" "json"];
        };
        language-servers = [
          {
            name = "typescript-language-server";
            except-features = ["format"];
          }
          "biome-lsp"
        ];
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
      }
      {
        name = "markdown";
        auto-format = true;
        formatter = {
          command = "${pkgs.nodePackages.prettier}/bin/prettier";
          args = ["--parser" "markdown"];
        };
        language-servers = ["marksman"];
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
      }
      {
        name = "lua";
        auto-format = true;
        formatter = {
          command = "${pkgs.stylua}/bin/stylua";
          args = ["-"];
        };
        language-servers = ["lua-language-server"];
      }
      {
        name = "nu";
        auto-format = true;
        formatter = {
          command = "${pkgs.nushell}/bin/nu";
          args = ["--format"];
        };
      }
      {
        name = "nix";
        auto-format = true;
        formatter = {
          command = "${pkgs.alejandra}/bin/alejandra";
          args = ["-q"];
        };
        language-servers = ["nil"];
      }
    ];

    language-server = {
      astro-ls = {
        command = "${pkgs.astro-language-server}/bin/astro-ls";
        args = ["--stdio"];
      };
      biome-lsp = {
        command = "biome";
        args = ["lsp-proxy"];
      };

      emmet-lsp = {
        command = "${pkgs.emmet-ls}/bin/emmet-ls";
        args = ["--stdio"];
      };

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      vscode-css-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/css-languageserver";
        args = ["--stdio"];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
          scss.validate.enable = true;
        };
      };

      lua-language-server = {
        command = "${pkgs.lua-language-server}/bin/lua-language-server";
        config = {
          runtime = {
            version = "LuaJIT";
            path = [
              "?.lua"
              "?/init.lua"
            ];
          };
          diagnostics = {
            globals = ["vim"]; # Useful if you're working with Neovim config
          };
          workspace = {
            library = {};
            maxPreload = 2000;
            preloadFileSize = 1000;
            checkThirdParty = false;
          };
          telemetry = {
            enable = false;
          };
          format = {
            enable = true;
            defaultConfig = {
              indent_style = "space";
              indent_size = "2";
            };
          };
        };
      };

      gopls = {
        command = "${pkgs.gopls}/bin/gopls";
      };

      yaml-language-server = {
        command = "${pkgs.yaml-language-server}/bin/yaml-language-server";
        args = ["--stdio"];
      };

      marksman = {
        command = "${pkgs.marksman}/bin/marksman";
      };
    };
  };
}
