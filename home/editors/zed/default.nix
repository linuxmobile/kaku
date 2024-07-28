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
    dock = "right";
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
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
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
      version = "1";
      provider = {
        api_url = "https://api.groq.com/openai/v1/";
        type = "openai";
        default_model = {
          custom = {
            name = "llama-3.1-70b-versatile";
            max_tokens = 32000;
          };
        };
      };
    };
  };
}
