{
  self,
  inputs,
  default,
  ...
}: let
  # system-agnostic args
  module_args._module.args = {
    inherit default inputs self;
  };
in {
  imports = [
    {
      _module.args = {
        # we need to pass this to HM
        inherit module_args;

        # NixOS modules
        sharedModules = [
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
          inputs.agenix.nixosModules.default
          inputs.hm.nixosModule
          inputs.hyprland.nixosModules.default
          inputs.nh.nixosModules.default
          module_args

          self.nixosModules.core
          self.nixosModules.nix
          self.nixosModules.network
          ./security.nix
        ];
      };
    }
  ];

  flake.nixosModules = {
    core = import ./core.nix;
    desktop = import ./desktop.nix;
    nix = import ./nix.nix;
    network = import ./network.nix;
  };
}
