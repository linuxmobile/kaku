{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
