{
  lib,
  pkgs,
  ...
}:
# lanzaboote config
{
  boot.loader = {
    limine = {
      enable = true;
      efiSupport = true;
      style.wallpapers = [pkgs.nixos-artwork.wallpapers.simple-dark-gray-bootloader.gnomeFilePath];
      maxGenerations = 10;
      secureBoot.enable = true;
    };
    systemd-boot.enable = lib.mkForce false;
  };

  environment.systemPackages = [pkgs.sbctl];
}
