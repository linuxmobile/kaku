{
  services = {
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';
  };
}
