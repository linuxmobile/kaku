{
  inputs,
  pkgs,
  ...
}: let
  marketplace = inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
  marketplace-release = inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace-release;
in {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;
    mutableExtensionsDir = true;
    extensions =
      (with pkgs.vscode-extensions; [
        astro-build.astro-vscode
        bbenoist.nix
        bradlc.vscode-tailwindcss
        christian-kohler.path-intellisense
        eamodio.gitlens
        esbenp.prettier-vscode
        formulahendry.auto-close-tag
        kamadorueda.alejandra
        naumovs.color-highlight
        usernamehw.errorlens
      ])
      ++ (with marketplace; [
        catppuccin.catppuccin-vsc-icons
        github.copilot
        mvllow.rose-pine
        re1san.tsuki
        vue.volar
      ])
      ++ (with marketplace-release; [
        github.copilot-chat
      ]);
    userSettings = {
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Tsuki";
      "editor.fontFamily" = "GeistMono Nerd Font, Catppuccin Mocha, 'monospace', monospace";
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "files.trimTrailingWhitespace" = true;
      "terminal.integrated.fontFamily" = "GeistMono Nerd Font";
      "window.titleBarStyle" = "custom";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.enableVisualBell" = false;
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
      "window.restoreWindows" = "all";
      "window.menuBarVisibility" = "toggle";
      "workbench.panel.defaultLocation" = "right";
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
      "workbench.editor.tabActionLocation" = "left";
      "window.autoDetectColorScheme" = true;
      "window.dialogStyle" = "native";
    };
  };
}
