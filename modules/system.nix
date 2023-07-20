{
  pkgs,
  lib,
  ...
}:
# configuration shared by all hosts
{
  # remove bloat
  documentation.nixos.enable = false;

  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  time.timeZone = lib.mkDefault "America/Argentina/Buenos_Aires";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    # saves space
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_ADDRESS = "es_AR.UTF-8";
      LC_IDENTIFICATION = "es_AR.UTF-8";
      LC_MEASUREMENT = "es_AR.UTF-8";
      LC_MONETARY = "es_AR.UTF-8";
      LC_NAME = "es_AR.UTF-8";
      LC_NUMERIC = "es_AR.UTF-8";
      LC_PAPER = "es_AR.UTF-8";
      LC_TELEPHONE = "es_AR.UTF-8";
      LC_TIME = "es_AR.UTF-8";
    };
  };

# Configure console keymap
  console.keyMap = "la-latin1";

  # graphics drivers / HW accel
  hardware.opengl.enable = true;

  # enable programs
  programs = {
    zsh = {
      enable = true;
    };
  };

  # don't ask for password for wheel group
  security.sudo.wheelNeedsPassword = false;

  users.users.linuxmobile = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["input" "libvirtd" "networkmanager" "plugdev" "video" "wheel"];
  };

  # compresses half the ram for use as swap
  zramSwap.enable = true;

# don't touch this
  system.stateVersion = lib.mkDefault "23.05";
}
