{pkgs, ...}: {
  users.users.banumath = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "adbusers"
      "input"
      "networkmanager"
      "plugdev"
      "video"
      "wheel"
      "kvm"
    ];
  };
}
