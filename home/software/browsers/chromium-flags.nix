_: {
  xdg.configFile."chromium-flags.conf".text = ''
    # Wayland support
    --ozone-platform=wayland

    # GPU and Video Acceleration Flags
    --use-gl=desktop
    --ignore-gpu-blocklist
    --enable-gpu-rasterization
    --enable-zero-copy
    --enable-vulkan
    --disable-gpu-driver-bug-workarounds
    --disable-features=UseChromeOSDirectVideoDecoder
    --enable-features=UseOzonePlatform,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,VaapiIgnoreDriverChecks,OverlayScrollbar,ParallelDownloading

    # Performance
    --enable-hardware-overlays
    --enable-accelerated-video-decode
    --enable-accelerated-video-encode
    --enable-accelerated-mjpeg-decode
    --enable-oop-rasterization
    --enable-raw-draw
    --enable-webgl-developer-extensions
    --enable-accelerated-2d-canvas
    --enable-direct-composition
    --enable-drdc
    --enable-gpu-compositing

    # Smooth browsing
    --enable-media-router
    --enable-smooth-scrolling

    # UnGoogled features
    --disable-search-engine-collection
    --extension-mime-request-handling=always-prompt-for-install
    --fingerprinting-canvas-image-data-noise
    --fingerprinting-canvas-measuretext-noise
    --fingerprinting-client-rects-noise
    --popups-to-tabs
    --force-punycode-hostnames
    --show-avatar-button=incognito-and-guest

    # Miscellaneous
    --no-default-browser-check
    --no-pings
  '';

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    LIBVA_MESSAGING_LEVEL = "1";
    LIBGL_ALWAYS_SOFTWARE = "0";

    # Force hardware video acceleration
    ENABLE_VAAPI = "1";
    ENABLE_VDPAU = "1";

    # VA-API hardware video encoding
    VAAPI_DISABLE_ENCODER_CHECKING = "1";

    EGL_PLATFORM = "wayland";
  };
}
