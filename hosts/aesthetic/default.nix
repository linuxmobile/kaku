{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix ./profiles/gnome];

  boot = {
    # load modules on boot
    kernelModules = ["amdgpu" "v4l2loopback" "i2c-dev"]; # add v4l2loopback when fixed
    kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelParams = [
      "amd_pstate=active"
      "amd_iommu"
      "mitigations=off"
      "ideapad_laptop.allow_v4_dytc=Y"
      "nvme_core.default_ps_max_latency_us=0"
    ];
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
      "kernel.nmi_watchdog" = 0;
    };
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 card_label="OBS Virtual Output"
    '';
  };

  networking.hostName = "aesthetic";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
    scx.enable = true;
    scx.scheduler = "scx_rusty";
  };
}
