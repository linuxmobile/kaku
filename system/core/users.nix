{pkgs, ...}: {
  users.users.banumath = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [
      "adbusers"
      "input"
      "libvirtd"
      "networkmanager"
      "plugdev"
      "transmission"
      "video"
      "wheel"
      "kvm"
  "podman"
    ];
  };
}
