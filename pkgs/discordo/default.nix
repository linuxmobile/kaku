{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
  makeWrapper,
  xsel,
  wl-clipboard,
}:
buildGoModule rec {
  pname = "discordo";
  version = "unstable-2024-04-27";

  src = fetchFromGitHub {
    owner = "ayn2op";
    repo = pname;
    rev = "ca988b5fa318100f4e967b8ba4dbd7cabdf81176";
    hash = "sha256-71i/8t768RtD0Gk2cpSdznERSNf1gErQrrOGYiZz05g=";
  };

  vendorHash = "sha256-dBJYTe8aZtNuBwmcpXb3OEHoLVCa/GbGExLIRc8cVbo=";

  CGO_ENABLED = 0;

  ldflags = ["-s" "-w"];

  # Clipboard support on X11 and Wayland
  nativeBuildInputs = [makeWrapper];

  postInstall = ''
    wrapProgram $out/bin/discordo \
      --prefix PATH : ${lib.makeBinPath [xsel wl-clipboard]}
  '';

  passthru.updateScript = nix-update-script {
    extraArgs = ["--version=branch"];
  };

  meta = with lib; {
    description = "A lightweight, secure, and feature-rich Discord terminal client";
    homepage = "https://github.com/ayn2op/discordo";
    license = licenses.mit;
    maintainers = [maintainers.arian-d];
    mainProgram = "discordo";
  };
}
