{
  self,
  pkgs,
  ...
}: {
  programs.neovim = {enable = true;};

  home.file = {".config/nvim/".source = "${self.packages.${pkgs.system}.kodo}";};
}
