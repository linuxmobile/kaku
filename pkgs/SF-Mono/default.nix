{
  stdenv,
  lib,
  fetchFromGitHub,
  unzip,
}:
stdenv.mkDerivation {
  pname = "SF-Mono";
  version = "v3.1.1";

  src = fetchFromGitHub {
    owner = "cpea2506";
    repo = "LigaSFMonoNerdFont";
    rev = "master";
    sha256 = "sha256-T17l4XflOKexj8HNyir8gfVelbNFSy2SszYws+now1I=";
  };

  nativeBuildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype
  '';

  meta = with lib; {
    description = "San Francisco Pro Mono";
    homepage = "https://github.com/cpea2506/LigaSFMonoNerdFont";
    license = licenses.mit;
    maintainers = [maintainers.cpea2506];
  };
}
