{
  inputs,
  withSystem,
  sharedModules,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = withSystem "x86_64-linux" ({
    system,
    self',
    inputs',
    ...
  }: let
    systemInputs = {_module.args = {inherit self' inputs';};};
    inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    linudev = nixosSystem {
      inherit system;

      modules =
        [
          ./linudev
          ../modules/desktop.nix
          # ../modules/lanzaboote.nix
          {home-manager.users.linuxmobile.imports = homeImports."linuxmobile@linudev";}
          systemInputs
        ]
        ++ sharedModules;
    };
  });
}
