{
  lib,
  stdenv,
  pkgs,
}: let
  custom = ./custom;
in
  stdenv.mkDerivation {
    pname = "kodo";
    version = "2.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "chadcat7";
      repo = "kodo";
      rev = "refs/heads/main";
      sha256 = "sha256-dQT/LYaESsnN79BOfwU7mtk3tsz/UILJw8SXmx16vos=";
    };

    installPhase = ''
      mkdir $out
      cp -r * "$out/"
      cp -rf ${custom}/* "$out/"
      touch "$out/lazy-lock.json"
      chmod -R 0777 "$out/lazy-lock.json"
    '';

    meta = with lib; {
      description = "Kodo is a Neovim configuration framework written in Lua.";
      homepage = "https://github.com/chadcat7/kodo";
      platforms = platforms.all;
      maintainers = [maintainers.chadcat7];
      license = licenses.mit;
    };
  }
