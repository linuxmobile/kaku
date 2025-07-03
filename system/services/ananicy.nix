{pkgs, ...}: {
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    # from nixpkgs: ananicy-rules-cachyos
    rulesProvider = pkgs.ananicy-rules-cachyos_git.overrideAttrs (prevAttrs: {
      patches = [
        (pkgs.fetchpatch {
          # Revert removal of Compiler rules
          url = "https://github.com/CachyOS/ananicy-rules/commit/5459ed81c0e006547b4f3a3bc40c00d31ad50aa9.patch";
          revert = true;
          hash = "sha256-vc6FDwsAA6p5S6fR1FSdIRC1kCx3wGoeNarG8uEY2xM=";
        })
      ];
    });
  };
}
