{ lib, config, pkgs, ... }:

with lib;

let
  cfg = config.modules.nvim;
in

{
  options.modules.nvim = { enable = mkEnableOption "nvim"; };
  config = mkIf cfg.enable {
    xdg.configFile."nvim" = {
      source = "${pkgs.nvchad}";
      recursive = true;
    };
    home.packages = with pkgs; [
      # lua stuff
      lua-language-server
      stylua

      # web dev
      nodePackages.typescript-language-server
      nodePackages.tailwindcss
      nodePackages.prettier
      deno
      nil
      rnix.lsp
      marksman
    ];
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
