{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nil
    typescript-language-server
    typescript
    zed-editor
    astro-language-server
  ];
}
