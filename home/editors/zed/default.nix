{
  config,
  pkgs,
  ...
}: let
  zedNodeFixScript = pkgs.writeShellScriptBin "zedNodeFixScript" ''
    nodeVersion="node-v${pkgs.nodejs.version}-linux-x64"
    zedNodePath="${config.xdg.dataHome}/zed/node/$nodeVersion"

    # Eliminar la versión de node descargada por zed-editor
    rm -rf $zedNodePath

    # Crear el enlace simbólico a la versión de node de nixpkgs
    ln -sfn ${pkgs.nodejs} $zedNodePath
  '';
in {
  home.packages = with pkgs; [
    zed-editor
    nodejs
    biome
    vue-language-server
    zedNodeFixScript
  ];
  home.file.".config/zed/settings.json".text = ''
    {
      "theme": {
        "mode": "system",
        "dark": "Catbox Dark",
        "light": "Catbox Latte"
      },
      "ui_font_size": 16,
      "buffer_font_size": 14,
      "auto_update": false,
      "scrollbar": {
        "show": "never"
      },
      "tab_bar": {
        "show": false
      },
      "toolbar": {
        "breadcrumbs": true,
        "quick_actions": false
      },
      "tab_size": 2,
      "telemetry": {
        "diagnostics": false,
        "metrics": false
      },
      "format_on_save": "on",
      "formatter": {
        "external": {
          "command": "${pkgs.biome}/bin/biome",
          "arguments": ["format", "--write", "--stdin-file-path", "{buffer_path}"]
        }
      },
      "lsp": {
        "biome": {
          "settings": {
            "config_path": "${config.xdg.configHome}/biome/config.json"
          }
        }
      }
      "assistant": {
        "enabled": true,
        "version": "1",
        "provider": {
          "api_url": "https://api.groq.com/openai/v1/"
          "type": "openai",
          "default_model": {
            "custom": {
              "name": "llama3-8B-8k",
              "max_tokens": 32000,
            }
          },
        }
      }
    }
  '';
}
