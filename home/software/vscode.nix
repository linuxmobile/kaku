{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    extensions = with pkgs.vscode-extensions;
      [
        bbenoist.nix

        # catppuccin.catppuccin-vsc
        pkief.material-icon-theme

        formulahendry.auto-close-tag
        christian-kohler.path-intellisense
        naumovs.color-highlight
        usernamehw.errorlens
        eamodio.gitlens
        dbaeumer.vscode-eslint

        esbenp.prettier-vscode
        kamadorueda.alejandra
        # ms-vsliveshare.vsliveshare
        astro-build.astro-vscode
        bradlc.vscode-tailwindcss
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "catppuccin-perfect-icons";
          publisher = "thang-nm";
          version = "0.21.10";
          sha256 = "sha256-6qQPKB0LlBYAMEYPpjl6NAJyqutLFv+g+XGw4hTV1Nw=";
        }
        {
          name = "Everblush";
          publisher = "mangeshrex";
          version = "0.1.1";
          sha256 = "sha256-hqRf3BGQMwFEpOMzpELMKmjS1eg4yPqgTiHQEwi7RUw=";
        }
        {
          name = "copilot-chat";
          publisher = "GitHub";
          version = "0.5.2023072701";
          sha256 = "sha256-Jt5WBX/ETehIPOh+Vdn4Rsqe2ueBsba7B6IZQ0r/QHI=";
        }
        {
          name = "discord-vscode";
          publisher = "icrawl";
          version = "5.8.0";
          sha256 = "sha256-IU/looiu6tluAp8u6MeSNCd7B8SSMZ6CEZ64mMsTNmU=";
        }
        {
          name = "unocss";
          publisher = "antfu";
          version = "0.54.1";
          sha256 = "sha256-Jlwm1INhA+o2gZmYB8e9RBENJaeSxroCk2YzarYAWHQ=";
        }
      ];
    userSettings = {
      "workbench.iconTheme" = "catppuccin-perfect-mocha";
      "workbench.colorTheme" = "Everblush";
      "catppuccin.accentColor" = "mauve";
      "editor.fontFamily" = "Cartograph CF Nerd Font, Catppuccin Perfect Mocha, 'monospace', monospace";
      "editor.fontSize" = 12;
      "editor.fontLigatures" = true;
      "workbench.fontAliasing" = "antialiased";
      "files.trimTrailingWhitespace" = true;
      "terminal.integrated.fontFamily" = "Cartograph CF Nerd Font";
      "window.titleBarStyle" = "custom";
      "terminal.integrated.automationShell.linux" = "nix-shell";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.enableBell" = false;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
      "editor.minimap.enabled" = false;
      "editor.minimap.renderCharacters" = false;
      "editor.overviewRulerBorder" = false;
      "editor.renderLineHighlight" = "all";
      "editor.inlineSuggest.enabled" = true;
      "editor.smoothScrolling" = true;
      "editor.suggestSelection" = "first";
      "editor.guides.indentation" = true;
      "editor.guides.bracketPairs" = true;
      "editor.bracketPairColorization.enabled" = true;
      "window.nativeTabs" = true;
      "window.restoreWindows" = "all";
      "window.menuBarVisibility" = "toggle";
      "workbench.panel.defaultLocation" = "right";
      "workbench.editor.tabCloseButton" = "left";
      "workbench.list.smoothScrolling" = true;
      "security.workspace.trust.enabled" = false;
      "explorer.confirmDelete" = false;
      "breadcrumbs.enabled" = true;
      "telemetry.telemetryLevel" = "off";
      "workbench.startupEditor" = "newUntitledFile";
      "editor.cursorBlinking" = "expand";
      "security.workspace.trust.untrustedFiles" = "open";
      "security.workspace.trust.banner" = "never";
      "security.workspace.trust.startupPrompt" = "never";
      "workbench.sideBar.location" = "right";
      "editor.tabSize" = 2;
      "editor.wordWrap" = "on";
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
  };
}
