{inputs, ...}: {
  imports = [
    inputs.hm.nixosModules.default
    inputs.nixos-cosmic.nixosModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
