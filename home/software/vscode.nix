{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    extensions = with pkgs.vscode-extensions;
      [
        bbenoist.nix

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
          version = "0.21.24";
          sha256 = "sha256-6qQPKB0LlBYAMEYPpjl6NAJyqutLFv+g+XGw4hTV1Nw=";
        }
        {
          name = "rose-pine-burnt";
          publisher = "SulSami";
          version = "1.0.3";
          sha256 = "sha256-EgDxfzL++nUSZB1Gx/vBoH2jbojxxTKPs28iS2Z8jxM=";
        }
        {
          name = "copilot-chat";
          publisher = "GitHub";
          version = "0.9.2023101301";
          sha256 = "sha256-Jt5WBX/ETehIPOh+Vdn4Rsqe2ueBsba7B6IZQ0r/QHI=";
        }
        {
          name = "unocss";
          publisher = "antfu";
          version = "0.56.5";
          sha256 = "sha256-Jlwm1INhA+o2gZmYB8e9RBENJaeSxroCk2YzarYAWHQ=";
        }
      ];
    userSettings = {
      "workbench.iconTheme" = "catppuccin-perfect-mocha";
      "workbench.colorTheme" = "Rosé Pine Burnt";
      "editor.fontFamily" = "Maple Mono SC NF, Catppuccin Perfect Mocha, 'monospace', monospace";
      "editor.fontSize" = 12;
      "editor.fontLigatures" = true;
      "workbench.fontAliasing" = "antialiased";
      "files.trimTrailingWhitespace" = true;
      "terminal.integrated.fontFamily" = "Maple Mono SC NF";
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
