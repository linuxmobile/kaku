{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
