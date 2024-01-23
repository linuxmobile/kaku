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
    inherit (import "${self}/system") desktop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    aesthetic = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          ./aesthetic
          "${mod}/programs/hyprland.nix"
          "${mod}/services/gnome-services.nix"
          "${mod}/services/location.nix"
          {
            home-manager = {
              users.linuxmobile.imports =
                homeImports."linuxmobile@aesthetic";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
        ];
    };
  };
}
