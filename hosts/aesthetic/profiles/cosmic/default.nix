{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    cosmic-applets
    cosmic-applibrary
    cosmic-bg
    cosmic-comp
    cosmic-icons
    cosmic-launcher
    cosmic-notifications
    cosmic-osd
    cosmic-panel
    cosmic-session
    cosmic-settings
    cosmic-settings-daemon
    cosmic-workspaces-epoch
    xdg-desktop-portal-cosmic
    cosmic-greeter
    cosmic-protocols
    cosmic-edit
    cosmic-screenshot
    cosmic-design-demo
    cosmic-term
    cosmic-randr
    cosmic-files
  ];

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
}
