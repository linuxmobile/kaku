{
  inputs,
  sharedModules,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    aesthetic = nixosSystem {
      modules =
        [
          ./aesthetic
          # ../modules/greetd.nix
          ../modules/desktop.nix
          {
            home-manager.users.linuxmobile.imports =
              homeImports."linuxmobile@aesthetic";
          }
        ]
        ++ sharedModules;
    };
  };
}
