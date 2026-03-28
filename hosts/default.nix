{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get the basic config to build on top of
    inherit (import "${self}/system") desktop laptop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    aesthetic = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ laptop
        ++ [
          ./aesthetic
          "${mod}/services/gnome-services.nix"
          "${mod}/core/limine.nix"
          {
            home-manager = {
              users.linuxmobile.imports =
                homeImports."linuxmobile@aesthetic";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
        ];
    };
  };
}
