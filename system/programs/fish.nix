{pkgs, ...}: {
  environment.shells = [pkgs.fish];
  environment.pathsToLink = ["/share/fish"];

  programs = {
    less.enable = true;

    fish = {
      enable = true;
    };
  };
}
