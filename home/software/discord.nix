{
  pkgs,
  lib,
  ...
}: {
  xdg.configFile."discordcanary/settings.json".text = builtins.toJSON {
    SKIP_HOST_UPDATE = true;
    IS_MAXIMIZED = true;
    IS_MINIMIZED = false;
    trayBalloonShown = true;
  };
  home.packages = let
    flags = [
      "--flag-switches-begin"
      "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer"
      "--flag-switches-end"
      "--ozone-platform=wayland"
      "--enable-webrtc-pipewire-capturer"
      "--disable-gpu-memory-buffer-video-frames"
      "--enable-accelerated-mjpeg-decode"
      "--enable-accelerated-video"
      "--enable-gpu-rasterization"
      "--enable-native-gpu-memory-buffers"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
    ];
    pkg =
      (pkgs.discord-canary.override {
        nss = pkgs.nss_latest;
        # withOpenASAR = true;
      })
      .overrideAttrs (old: {
        preInstall = ''
          gappsWrapperArgs+=("--add-flags" "${lib.concatStringsSep " " flags}")
        '';
      });
  in [pkg];
}
