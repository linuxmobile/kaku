{ inputs', pkgs, self, self', ... }: {
  boot.plymouth = {
    enable = true;
    themePackages = [ self'.packages.catppuccin-plymouth ];
    theme = "catppuccin-mocha";
  };

  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      jost
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "CartographCF Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  hardware = {
    opengl = {
      extraPackages = with pkgs; [ vaapiVdpau libvdpau-va-gl ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ vaapiVdpau libvdpau-va-gl ];
    };
  };

  # enable location service
  # location.provider = "geoclue2";

  nix = {
    # package = inputs'.nix-super.packages.nix;
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.privatevoid.net"
        #"https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
        #"nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
  };

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
    seahorse.enable = true;
  };

  services = {
    # provide location
    geoclue2.enable = true;

    gnome.gnome-keyring.enable = true;

    # xserver.displayManager.sddm.enable = true;

    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;

      # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
      # lowLatency.enable = true;
    };

    # battery info & stuff
    # upower.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [ pkgs.gcr ];
  };

  security = {
    # allow wayland lockers to unlock the screen
    pam.services.swaylock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
