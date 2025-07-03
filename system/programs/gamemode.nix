{inputs, ...}: {
  programs.gamemode = {
    enable = false;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
    };
  };

  # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
  services.pipewire.lowLatency.enable = true;
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
}
