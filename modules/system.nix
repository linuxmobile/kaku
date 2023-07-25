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
  };

# Configure console keymap
  console.keyMap = "la-latin1";

  # graphics drivers / HW accel
  hardware.opengl.enable = true;

  # enable programs
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting = {
        enable = true;
        patterns = {"rm -rf *" = "fg=black,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };
    };
  };

  # don't ask for password for wheel group
  security.sudo.wheelNeedsPassword = false;

  users.users.linuxmobile = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["input" "libvirtd" "networkmanager" "plugdev" "video" "wheel"];
  };

  nixpkgs.config.allowUnfree = true;
  # compresses half the ram for use as swap
  zramSwap.enable = true;

# don't touch this
  system.stateVersion = lib.mkDefault "23.05";
}
