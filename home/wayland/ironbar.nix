{pkgs, ...}:
{
  home.packages = with pkgs; [
    swww
  ];
  programs.ironbar = {
    enable = true;
  };
}
