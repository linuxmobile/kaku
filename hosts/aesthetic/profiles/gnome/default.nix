{
  config,
  lib,
  pkgs,
  ...
}: {
  environment = {
    sessionVariables = {
      NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    };

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    systemPackages = with pkgs; [
      gnome-text-editor
      ffmpegthumbnailer
      adwaita-icon-theme
      dconf-editor
      gnome-themes-extra
      gnome-tweaks
      nautilus-python
      nautilus-open-any-terminal
      wl-clipboard
      gnome-text-editor
    ];

    gnome.excludePackages =
      (with pkgs; [
        gnome-console
        gedit
        gnome-connections
        gnome-photos
        gnome-tour
        snapshot
        cheese
        epiphany
        geary
        evince
        decibels
      ])
      ++ (with pkgs; [
        eog
        gnome-music
        gnome-characters
        totem
        tali
        iagno
        hitori
        atomix
        yelp
        gnome-contacts
        gnome-initial-setup
        simple-scan
        gnome-shell-extensions
        gnome-maps
        gnome-font-viewer
      ]);
  };

  services = {
    displayManager = {
      gdm = {
        wayland = true;
        enable = true;
      };
    };
    xserver.desktopManager.xterm.enable = lib.mkForce false;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [
        pkgs.nautilus-open-any-terminal
      ];
    };
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "linuxmobile";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  services.udev.packages = with pkgs; [gnome-settings-daemon];

  programs.dconf.profiles = {
    gdm.databases = [
      {
        settings = {
          "org/gnome/mutter".experimental-features = ["scale-monitor-framebuffer"];
          "org/gnome/desktop/peripherals/touchpad".tap-to-click = true;
        };
      }
    ];
  };
}
