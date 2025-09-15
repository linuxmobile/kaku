{pkgs, ...}: {
  users.users.linuxmobile = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [
      "adbusers"
      "input"
      "networkmanager"
      "plugdev"
      "video"
      "wheel"
    ];
  };
}
