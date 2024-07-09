{config, ...}: {
  imports = [./hardware-configuration.nix ./powersave.nix];

  boot = {
    # load modules on boot
    kernelModules = ["amdgpu" "v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelParams = [
      "amd_pstate=active"
      "ideapad_laptop.allow_v4_dytc=Y"
      "nvme_core.default_ps_max_latency_us=0"
    ];
  };

  networking.hostName = "aesthetic";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
