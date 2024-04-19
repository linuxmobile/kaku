_: {
  imports = [
    ./hardware-configuration.nix
    ./powersave.nix
    ./profiles/gnome
  ];

  boot = {
    # load modules on boot
    kernelModules = ["amdgpu"];
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
