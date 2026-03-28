{pkgs, ...}: {
  users.users.banumath = {
    isNormalUser = true;
    description = "Banumath Hettiarachchi";
    shell = pkgs.fish;
    extraGroups = [
      "adbusers"
      "input"
      "networkmanager"
      "plugdev"
      "video"
      "wheel"
      "kvm"
      "docker"
    ];
  };
}
