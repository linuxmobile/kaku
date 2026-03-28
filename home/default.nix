{inputs, ...}: {
  imports = [
    ./terminal
    inputs.nix-index-db.homeModules.nix-index
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];
  home = {
    username = "linuxmobile";
    homeDirectory = "/home/linuxmobile";
    stateVersion = "24.05";
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs = {
    home-manager.enable = true;
    nix-index = {
      enable = true;
      # enableNushellIntegration = true;
    };
  };
}
