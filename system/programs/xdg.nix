{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = ["gnome" "gtk"];
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
