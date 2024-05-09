{
  pkgs,
  inputs,
  ...
}: {
  # environment = {
  #   systemPackages = with pkgs; [
  #     ffmpegthumbnailer
  #     gnome.adwaita-icon-theme
  #     gnome.dconf-editor
  #     gnome.gnome-tweaks
  #     gnome.gnome-themes-extra
  #     gnome.nautilus-python
  #     nautilus-open-any-terminal
  #     wl-clipboard
  #   ];

  #   gnome.excludePackages =
  #     (with pkgs; [
  #       # gnome-console
  #       gedit
  #       gnome-connections
  #       gnome-photos
  #       gnome-text-editor
  #       gnome-tour
  #       nano
  #       snapshot
  #     ])
  #     ++ (with pkgs.gnome; [
  #       cheese # webcam tool
  #       eog
  #       gnome-music
  #       epiphany # web browser
  #       geary # email reader
  #       evince # document viewer
  #       gnome-characters
  #       totem # video player
  #       tali # poker game
  #       iagno # go game
  #       hitori # sudoku game
  #       atomix # puzzle game
  #       yelp # Help view
  #       gnome-contacts
  #       gnome-initial-setup
  #       simple-scan
  #       gnome-shell-extensions
  #       gnome-maps
  #       gnome-font-viewer
  #       gnome-online-miners
  #     ]);
  # };

  services.xserver = {
    enable = true;
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic = {
      enable = true;
    };
  };
}
