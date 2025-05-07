{pkgs, ...}: {
  imports = [./start-cosmic-ext-niri.nix];
  environment = {
    variables.NIXOS_OZONE_WL = "1";
    sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

    # cosmic.excludePackages = with pkgs; [
    #   cosmic-player
    #   cosmic-store
    #   cosmic-term
    # ];
    systemPackages = with pkgs; [
      # cosmic-ext-applet-clipboard-manager
      # cosmic-ext-applet-emoji-selector
      # examine
      forecast
      wl-clipboard
    ];
  };

  services = {
    desktopManager.cosmic = {
      enable = true;
      xwayland.enable = false;
    };

    displayManager.cosmic-greeter.enable = true;
  };
}
