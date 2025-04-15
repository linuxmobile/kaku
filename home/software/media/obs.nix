{pkgs, ...}: {
  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-gstreamer
        obs-pipewire-audio-capture
        obs-vaapi
      ];
      package = pkgs.symlinkJoin {
        name = "obs-studio";
        paths = [
          (pkgs.obs-studio.override {
            pipewireSupport = true;
            browserSupport = true;
          })
        ];
        buildInputs = [pkgs.makeWrapper];
        postBuild = ''
          wrapProgram $out/bin/obs \
            --add-flags "--ozone-platform=wayland"
        '';
      };
    };
  };
}
