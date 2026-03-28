{lib, ...}: {
  imports = [
    ./security.nix
    ./users.nix
    ../nix
    ../programs/fish.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  console.keyMap = "us";

  # don't touch this
  system.stateVersion = lib.mkDefault "24.05";
  system = {
    switch.enable = true;
    rebuild.enableNg = true;
  };

  time.timeZone = lib.mkDefault "Asia/Colombo";
  time.hardwareClockInLocalTime = lib.mkDefault true;

  # compresses half the ram for use as swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };
}