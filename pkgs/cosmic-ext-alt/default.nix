{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage {
  pname = "cosmic-ext-alternative-startup";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Drakulix";
    repo = "cosmic-ext-alternative-startup";
    rev = "main";
    sha256 = "sha256-0kqn3hZ58uQMl39XXF94yQS1EWmGIK45/JFTAigg/3M=";
  };

  cargoHash = "sha256-DeMkAG2iINGden0Up013M9mWDN4QHrF+FXoNqpGB+mg=";

  meta = with lib; {
    description = "Alternative startup script for Cosmic desktop extensions";
    homepage = "https://github.com/Drakulix/cosmic-ext-alternative-startup";
    license = licenses.mit;
  };
}
