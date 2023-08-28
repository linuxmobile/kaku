{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot = {
    # load modules on boot
    kernelModules = [ "amdgpu" ];
    # use latest kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "amd_pstate=active"
      "amd_iommu=on"
      "nvme_core.default_ps_max_latency_us=0"
    ];
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  # Change systemd stop job timeout in NixOS configuration (Default = 90s)
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  environment.systemPackages = [ config.boot.kernelPackages.cpupower ];

  networking.hostName = "aesthetic";

  programs = {
    # enable hyprland and required options
    hyprland.enable = true;
    # steam.enable = true;
  };

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
