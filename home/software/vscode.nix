{ lib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    extensions = with pkgs.vscode-extensions;
      [
        bbenoist.nix

        catppuccin.catppuccin-vsc
        mvllow.rose-pine
        pkief.material-icon-theme

        formulahendry.auto-close-tag
        christian-kohler.path-intellisense
        naumovs.color-highlight
        usernamehw.errorlens
        eamodio.gitlens
        dbaeumer.vscode-eslint
        # icrawl.discord-vscode

        esbenp.prettier-vscode
        kamadorueda.alejandra
        ms-vsliveshare.vsliveshare
        astro-build.astro-vscode
        bradlc.vscode-tailwindcss
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "copilot-chat";
          publisher = "github";
          version = "0.5.2023072701";
          sha256 = "sha256-pmEACc4LGOipionf1SypUYjng+WHfuD1WhVEvXiQcbQ=";
        }
        {
          name = "discord-presence";
          publisher = "icrawl";
          version = "5.8.0";
          sha256 = "sha256-Ud3YviqpBDd2xzAVGw0/ylJAtU9tQbuU6DedLJjtHfY=";
        }
      ];
    userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "catppuccin.accentColor" = "mauve";
      "editor.fontFamily" =
        "Cartograph CF Nerd Font, Material Design Icons, 'monospace', monospace";
      "editor.fontSize" = 10;
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
    };
  };
}
