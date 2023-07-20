{
  config,
  lib,
  ...
}:
# networking configuration
{
  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };
    # DNS resolver
    resolved.enable = true;
  };
}
