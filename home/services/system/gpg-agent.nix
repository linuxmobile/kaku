{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableFishIntegration = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
