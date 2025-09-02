{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "banumath@aesthetic" = [
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
      "banumath_aesthetic" = homeManagerConfiguration {
        modules = homeImports."banumath@aesthetic";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
