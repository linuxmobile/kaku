{
  config,
  pkgs,
  lib,
  ...
}: let
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    targetPkgs = pkgs:
      with pkgs; [
        zed-editor
      ];
    runScript = "zed";
  };
  zedNodeFixScript = pkgs.writeShellScriptBin "zedNodeFixScript" ''
    nodeVersion="node-v${pkgs.nodejs.version}-linux-x64"
    zedNodePath="${config.xdg.dataHome}/zed/node/$nodeVersion"

    # Eliminar la versión de node descargada por zed-editor
    rm -rf $zedNodePath

    # Crear el enlace simbólico a la versión de node de nixpkgs
    ln -sfn ${pkgs.nodejs} $zedNodePath
  '';
  jsonGenerator = lib.generators.toJSON {};
in {
  home.packages = with pkgs; [
    zed-fhs
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nil
    zedNodeFixScript
  ];

  home.file.".config/zed/settings.json".text = jsonGenerator {
    theme = {
      mode = "system";
      dark = "Catbox Dark";
      light = "Catbox Latte";
    };
    project_panel = {
      dock = "left";
    };
    ui_font_size = 16;
    buffer_font_size = 14;
    server_url = "https://disable-stupid-crap.zed.invalid";
    auto_update = false;
    scrollbar = {
      show = "never";
    };
    tab_bar = {
      show = false;
    };
    toolbar = {
      breadcrumbs = true;
      quick_actions = false;
    };
    tab_size = 2;
    inlay_hints = {
      enabled = true;
    };
    journal = {
      hour_format = "hour24";
    };
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    calls = {
      mute_on_join = true;
      share_on_join = true;
    };
    terminal = {
      font_family = "ZedMono Nerd Font";
    };
    vim_mode = true;
    format_on_save = "on";
    formatter = {
      external = {
        command = "${pkgs.biome}/bin/biome";
        arguments = ["format" "--write" "--stdin-file-path" "{buffer_path}"];
      };
    };
    lsp = {
      biome = {
        settings = {
          config_path = "${config.xdg.configHome}/biome/config.json";
        };
        binary = {
          command = "${pkgs.biome}/bin/biome";
          args = ["lsp"];
        };
      };
      vscode-json-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
        args = ["--stdio"];
      };
      vscode-css-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
        args = ["--stdio"];
      };
      vscode-html-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
        args = ["--stdio"];
      };
      vscode-markdown-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-markdown-language-server";
        args = ["--stdio"];
      };
      vscode-eslint-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-eslint-language-server";
        args = ["--stdio"];
      };
      nil = {
        command = "${pkgs.nil}/bin/nil";
        args = ["--stdio"];
      };
      vue-language-server = {
        command = "${pkgs.vue-language-server}/bin/vue-language-server";
        args = ["--stdio"];
      };
    };
    assistant = {
      enabled = true;
      provider = {
        available_models = [
          {
            custom = {
              name = "llama-3.1-70b-versatile";
              max_tokens = 8000;
            };
          }
          {
            custom = {
              name = "llama3-70b-8192";
              max_tokens = 32000;
            };
          }
          {
            custom = {
              name = "llama3-70b-8192";
              max_tokens = 64000;
            };
          }
          {
            custom = {
              name = "openai/gpt-4o";
              max_tokens = 128000;
            };
          }
          {
            custom = {
              name = "google/gemini-flash-1.5";
              max_tokens = 2000000;
            };
          }
          {
            custom = {
              name = "deepseek/deepseek-coder";
              max_tokens = 32000;
            };
          }
        ];
        api_url = "https://openrouter.ai/api/v1";
        name = "openai";
        default_model = {
          custom = {
            name = "openai/gpt-4o";
            max_tokens = 128000;
          };
        };
      };
    };
  };
}
