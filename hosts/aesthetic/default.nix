{pkgs, ...}: {
  imports = [./hardware-configuration.nix];

  boot = {
    # load modules on boot
    kernelModules = ["amdgpu"];
    # use latest kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "amd_pstate=active"
      "nvme_core.default_ps_max_latency_us=0"
      "quiet"
      "loglevel=3"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
    supportedFilesystems = ["ntfs"];
    tmp.cleanOnBoot = true;
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

  networking.hostName = "aesthetic";

  programs = {
    hyprland.enable = true;
  };

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
