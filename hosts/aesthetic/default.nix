{
  pkgs,
  config,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot = {
    # load modules on boot
    kernelModules = ["amdgpu"];
    kernelParams = [
      "amd_pstate=active"
      "nvme_core.default_ps_max_latency_us=0"
    ];
  };

  networking.hostName = "aesthetic";

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
