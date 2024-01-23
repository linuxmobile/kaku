{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "linuxmobile@aesthetic" = [
      ../.
      ./aesthetic
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "linuxmobile_aesthetic" = homeManagerConfiguration {
        modules = homeImports."linuxmobile@aesthetic";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
