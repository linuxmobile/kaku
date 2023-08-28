{ self', ... }: {
  programs.neovim = { enable = true; };

  home.file = { ".config/nvim/".source = "${self'.packages.nvchad}"; };
}
